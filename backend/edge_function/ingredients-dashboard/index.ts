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

// Helper: Get Monday of the current week
function getCurrentMonday(d: Date): Date {
  const date = new Date(d);
  const day = date.getDay(); 
  const diff = date.getDate() - day + (day === 0 ? -6 : 1); 
  date.setDate(diff);
  date.setHours(0, 0, 0, 0); 
  return date;
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

    // 1. Auth Check
    const { data: { user }, error: authError } = await supabaseClient.auth.getUser()
    if (authError || !user) throw { code: 'UNAUTHORIZED', message: 'User is not authenticated' };

    // 2. Calculate Date
    const today = new Date();
    const currentMonday = getCurrentMonday(today);
    // Use ISO string for DB comparison, formatted string for logic matching
    const currentMondayStr = formatDate(currentMonday);
    
    // 3. Fetch Groups (Current and Future)
    // We get groups starting from today onwards
    const { data: groups, error: groupError } = await supabaseClient
        .schema('plan')
        .from('group')
        .select('id, start_date')
        .eq('user_id', user.id)
        .gte('start_date', currentMonday.toISOString())
        .order('start_date', { ascending: true });

    if (groupError) throw { code: 'DB_ERROR_GROUP', message: groupError.message };

    // 4. Separate Current vs Upcoming
    let currentGroup = null;
    const upcomingPlanList = [];

    // Find if we have a group strictly for "This Week"
    for (const g of groups) {
        const gDate = new Date(g.start_date);
        if (formatDate(gDate) === currentMondayStr) {
            currentGroup = g;
        } else {
            // If it's not this week, it's upcoming
            upcomingPlanList.push({
                group_id: g.id,
                start_date: formatDate(gDate)
            });
        }
    }

    // 5. Process Ingredient Aggregation (Only if current group exists)
    let currentWeekIngredients = null;

    if (currentGroup) {
        // A. Fetch Meal IDs
        const { data: meals, error: mealError } = await supabaseClient
            .schema('plan')
            .from('meal')
            .select('lunch, dinner')
            .eq('group_id', currentGroup.id);

        if (mealError) throw { code: 'DB_ERROR_MEALS', message: mealError.message };

        // B. Collect Recipe IDs
        const recipeIds = [...new Set(
            meals.flatMap((m: any) => [m.lunch, m.dinner]).filter((id: any) => id !== null)
        )];

        let categorizedBahan: any = {};

        if (recipeIds.length > 0) {
            // C. Fetch Ingredients
            const { data: details, error: detailsError } = await supabaseClient
                .schema('food')
                .from('ResepDetail')
                .select(`
                    quantity,
                    Bahan!inner(id, name, type, unit)
                `)
                .in('resep_id', recipeIds)
                .eq('Bahan.basket_hidden', false);

            if (detailsError) throw { code: 'DB_ERROR_DETAILS', message: detailsError.message };

            // D. Aggregate in JS
            const aggregationMap = new Map();
            for (const item of details) {
                if (!item.Bahan) continue; 
                const bahan = item.Bahan;
                
                if (aggregationMap.has(bahan.id)) {
                    const existing = aggregationMap.get(bahan.id);
                    existing.totalQuantity += item.quantity;
                } else {
                    aggregationMap.set(bahan.id, {
                        id: bahan.id,
                        name: bahan.name,
                        unit: bahan.unit,
                        type: bahan.type,
                        totalQuantity: item.quantity
                    });
                }
            }

            // E. Categorize & Sort
            const knownTypes = ['MEA', 'VEG', 'OTH'];
            for (const data of aggregationMap.values()) {
                const type = data.type && knownTypes.includes(data.type) 
                    ? data.type.toLowerCase() 
                    : 'unk';

                if (!categorizedBahan[type]) categorizedBahan[type] = [];

                categorizedBahan[type].push({
                    id: data.id,
                    name: data.name,
                    unit: data.unit,
                    quantity: data.totalQuantity
                });
            }

            // Sort alphabetically
            for (const key in categorizedBahan) {
                categorizedBahan[key].sort((a: any, b: any) => a.name.localeCompare(b.name));
            }
        }

        // Construct the current_week_ingredients object
        currentWeekIngredients = {
            group_id: currentGroup.id,
            start_date: currentMondayStr,
            bahan: categorizedBahan
        };
    }

    // 6. Response
    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
            current_week_ingredients: currentWeekIngredients,
            upcoming_plan: upcomingPlanList
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