import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Helper: Format Date to "d-M-yyyy"
function formatDate(date: Date): string {
  return `${date.getDate()}-${date.getMonth() + 1}-${date.getFullYear()}`;
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    // 1. Auth & Input
    const { data: { user }, error: authError } = await supabaseClient.auth.getUser()
    if (authError || !user) throw { code: 'UNAUTHORIZED', message: 'User is not authenticated' };

    const { group_id } = await req.json()
    if (!group_id) throw { code: 'INVALID_INPUT', message: 'group_id is required' };
    
    // --- STEP 1: Fetch Group Info & Recipe IDs ---

    // We run these in parallel for better performance
    const groupPromise = supabaseClient
        .schema('plan')
        .from('group')
        .select('id, start_date')
        .eq('id', group_id)
        .eq('user_id', user.id)
        .single();
    
    const mealsPromise = supabaseClient
        .schema('plan')
        .from('meal')
        .select('lunch, dinner')
        .eq('group_id', group_id);

    const [groupResult, mealsResult] = await Promise.all([groupPromise, mealsPromise]);

    if (groupResult.error || !groupResult.data) throw { code: 'NOT_FOUND', message: 'Plan group not found' };
    if (mealsResult.error) throw { code: 'DB_ERROR_MEALS', message: mealsResult.error.message };

    // Collect all non-null recipe IDs into a unique list
    const recipeIds = [...new Set(
        mealsResult.data.flatMap(meal => [meal.lunch, meal.dinner]).filter(id => id !== null)
    )];

    if (recipeIds.length === 0) {
        // If there are no recipes, return an empty list
        return new Response(
            JSON.stringify({
                is_success: true,
                data: {
                    group_id: groupResult.data.id,
                    start_date: formatDate(new Date(groupResult.data.start_date)),
                    bahan: {}
                }
            }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 }
        );
    }
    
    // --- STEP 2: Fetch and Filter Ingredients from DB ---
    // This single query gets all ingredients for all recipes and filters out the hidden ones at DB level.
    const { data: details, error: detailsError } = await supabaseClient
      .schema('food')
      .from('ResepDetail')
      .select(`
        quantity,
        Bahan!inner(
            id, name, type, unit
        )
      `)
      .in('resep_id', recipeIds)
      .eq('Bahan.basket_hidden', false);

    if (detailsError) throw { code: 'DB_ERROR_DETAILS', message: detailsError.message };

    // --- STEP 3: Aggregate Quantities in JavaScript ---
    const aggregationMap = new Map();

    for (const item of details) {
        if (!item.Bahan) continue; // Safety check if join somehow fails

        const bahan = item.Bahan;
        if (aggregationMap.has(bahan.id)) {
            // If exists, add to quantity
            const existing = aggregationMap.get(bahan.id);
            existing.totalQuantity += item.quantity;
        } else {
            // If new, create entry
            aggregationMap.set(bahan.id, {
                id: bahan.id,
                name: bahan.name,
                unit: bahan.unit,
                type: bahan.type,
                totalQuantity: item.quantity
            });
        }
    }

    // --- STEP 4 & 5: Categorize and Sort ---
    const categorizedBahan: Record<string, any[]> = {};
    const knownTypes = ['MEA', 'VEG', 'OTH'];

    for (const data of aggregationMap.values()) {
        const type = data.type && knownTypes.includes(data.type) 
            ? data.type.toLowerCase() 
            : 'unk';

        if (!categorizedBahan[type]) {
            categorizedBahan[type] = [];
        }

        categorizedBahan[type].push({
            id: data.id,
            name: data.name,
            unit: data.unit,
            quantity: data.totalQuantity
        });
    }

    // Sort each category list alphabetically by name
    for (const key in categorizedBahan) {
        categorizedBahan[key].sort((a, b) => a.name.localeCompare(b.name));
    }

    // --- STEP 6: Final Response ---
    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
            group_id: groupResult.data.id,
            start_date: formatDate(new Date(groupResult.data.start_date)),
            bahan: categorizedBahan
        }
      }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 }
    )

  } catch (err: any) {
    const errorCode = err.code || 'INTERNAL_ERROR';
    const errorMessage = err.message || 'An unexpected error occurred';

    return new Response(
      JSON.stringify({
        is_success: false,
        error_code: errorCode,
        error_message: errorMessage
      }),
      { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
    )
  }
})