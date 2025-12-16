import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
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

    const { data: { user }, error: authError } = await supabaseClient.auth.getUser()
    if (authError || !user) throw { code: 'UNAUTHORIZED', message: 'User is not authenticated' };

    const { resep_id } = await req.json()

    if (!resep_id) throw { code: 'INVALID_INPUT', message: 'resep_id is required' };

    // 1. Fetch Header (Resep)
    const resepPromise = supabaseClient
      .schema('food')
      .from('Resep')
      .select('id, name, en_name, type, class, picture, steps_link')
      .eq('id', resep_id)
      .single();

    // 2. Fetch Details (ResepDetail + Joined Bahan)
    // REMOVED COMMENTS inside the select string below to fix the error
    const bahanPromise = supabaseClient
      .schema('food')
      .from('ResepDetail')
      .select(`
        quantity,
        bahan_id,
        Bahan (
          name,
          type,
          unit
        )
      `)
      .eq('resep_id', resep_id);

      // 3. Fetch Bookmark Status (NEW)
    // We use .maybeSingle() so it doesn't throw an error if the user hasn't bookmarked it yet
    const bookmarkPromise = supabaseClient
      .schema('food')
      .from('Resep_Bookmark')
      .select('is_bookmarked')
      .eq('recipe_id', resep_id)
      .eq('user_id', user.id)
      .maybeSingle();

    const [resepResult, bahanResult, bookmarkResult] = await Promise.all([resepPromise, bahanPromise, bookmarkPromise]);

    if (resepResult.error) throw { code: 'DB_ERROR_RESEP', message: resepResult.error.message };
    if (bahanResult.error) throw { code: 'DB_ERROR_BAHAN', message: bahanResult.error.message };
    if (bookmarkResult.error) throw { code: 'DB_ERROR_BOOKMARK', message: bookmarkResult.error.message };
    
    if (!resepResult.data) throw { code: 'NOT_FOUND', message: 'Recipe not found' };

    // --- DATA PROCESSING ---
    const isBookmarked = bookmarkResult.data?.is_bookmarked ?? false;

    const formattedResep = {
      id: resepResult.data.id,
      name: resepResult.data.name,
      en_name: resepResult.data.en_name,
      reseptype: resepResult.data.type,
      classtype: resepResult.data.class,
      picture: resepResult.data.picture,
      steps_link: resepResult.data.steps_link,
      is_bookmarked: isBookmarked 
    };

    // Format Bahan List
    let formattedBahan = bahanResult.data.map((item: any) => ({
      id: item.bahan_id, 
      name: item.Bahan?.name ?? 'Unknown',
      bahantype: item.Bahan?.type ?? null,
      unittype: item.Bahan?.unit ?? null,
      qty: item.quantity
    }));

      // Define custom order
    const typeOrder: { [key: string]: number } = {
      'MEA': 1,
      'VEG': 2,
      'OTH': 3,
      null: 4,
      undefined: 4,
      '': 4
    };

    // Sort using the custom order
    formattedBahan.sort((a, b) => {
      const orderA = typeOrder[a.bahantype] ?? 4;
      const orderB = typeOrder[b.bahantype] ?? 4;
      return orderA - orderB;
    });
    
    // Sort by bahantype
    //formattedBahan.sort((a, b) => {
    //  const typeA = a.bahantype || '';
     // const typeB = b.bahantype || '';
    //  return typeA.localeCompare(typeB);
    //});

    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
          resep: formattedResep,
          bahan: formattedBahan
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