import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const PAGE_LIMIT = 20;

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

    // 1. Get Inputs
    const { cursor_id, classType } = await req.json()
    
    // Check if we are in "Bookmark Mode"
    const isBookmarkMode = classType === 'bookmark';

    // 2. Build Query
    // We start building the query on the 'Resep' table
    let query = supabaseClient.schema('food').from('Resep');

    // SELECT & FILTER LOGIC
    if (isBookmarkMode) {
      // --- BOOKMARK MODE ---
      // We use '!inner' to perform an INNER JOIN.
      // This means: "Only give me Resep rows that have a corresponding Resep_Bookmark row"
      query = query
        .select('id, name, en_name, picture, type, class, Resep_Bookmark!inner(user_id)') 
        .eq('Resep_Bookmark.user_id', user.id)
        .eq('Resep_Bookmark.is_bookmarked', true);
    } else {
      // --- NORMAL MODE ---
      query = query.select('id, name, en_name, picture, type, class');
      
      // Apply standard class filter (e.g., "Main Course") if provided and not empty
      if (classType) {
        query = query.eq('class', classType);
      }
    }

    // SHARED FILTERS (Apply to both modes)
    query = query
      .eq('is_hidden', false)
      // We specify 'Resep.id' explicitly to avoid ambiguity with Bookmark id
      .order('id', { ascending: true }) 
      .limit(PAGE_LIMIT);

    // Apply Cursor
    if (cursor_id) {
      query = query.gt('id', cursor_id);
    }

    const { data, error } = await query;

    if (error) throw { code: 'DB_ERROR', message: error.message };

    // 3. Map Data
    const mappedResep = data.map((item: any) => ({
      id: item.id,
      name: item.name,
      en_name: item.en_name,
      reseptype: item.type, 
      classtype: item.class,
      picture: item.picture
    }));

    let next_cursor = null;
    let next_data_counter = 0; 

    if (mappedResep.length > 0) {
      const lastItem = mappedResep[mappedResep.length - 1];
      next_cursor = lastItem.id;

      // 4. Calculate next_data_counter (Remaining Items)
      if (mappedResep.length < PAGE_LIMIT) {
        next_data_counter = 0;
      } else {
        // We need to build a SECOND query just for counting, mirroring the logic above
        let countQuery = supabaseClient.schema('food').from('Resep');

        if (isBookmarkMode) {
          countQuery = countQuery
            .select('*, Resep_Bookmark!inner(user_id)', { count: 'exact', head: true })
            .eq('Resep_Bookmark.user_id', user.id)
            .eq('Resep_Bookmark.is_bookmarked', true);
        } else {
          countQuery = countQuery
            .select('*', { count: 'exact', head: true });
          
          if (classType) {
            countQuery = countQuery.eq('class', classType);
          }
        }

        // Shared Count Filters
        countQuery = countQuery
          .eq('is_hidden', false)
          .gt('id', next_cursor);

        const { count, error: countError } = await countQuery;

        if (!countError && count !== null) {
          next_data_counter = count;
        }
      }
    }

    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
          resep_list: mappedResep,
          next_cursor: next_cursor,
          limit: PAGE_LIMIT,
          next_data_counter: next_data_counter
        },
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