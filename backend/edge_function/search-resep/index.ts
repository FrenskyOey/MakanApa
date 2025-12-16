import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const PAGE_LIMIT = 10; // Hardcoded limit for search

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

    // Check Auth
    const { data: { user }, error: authError } = await supabaseClient.auth.getUser()
    if (authError || !user) throw { code: 'UNAUTHORIZED', message: 'User is not authenticated' };

    const { resep_query } = await req.json()

    let query = supabaseClient
      .schema('food') 
      .from('Resep')
      .select('id, name, en_name, picture, type, class') 
      .eq('is_hidden', false)

    // LOGIC SWITCH:
    if (!resep_query || (typeof resep_query === 'string' && resep_query.trim() === '')) {
      // CASE 1: Empty Query -> Prefill with first 10 records
      // Sorted by ID to show "Latest" or "Default" list
      query = query
        .order('id', { ascending: true }) 
        .limit(PAGE_LIMIT)
    } else {
      // CASE 2: Has Query -> Search by Name/En_name
      // Sorted by Name so "Ayam..." appears before "Bebek..."
      query = query
        .or(`name.ilike.%${resep_query}%,en_name.ilike.%${resep_query}%`)
        .order('name', { ascending: true })
        .limit(PAGE_LIMIT) // <--- Enforce limit 10 here
    }

    const { data, error } = await query

    if (error) throw { code: 'DB_ERROR', message: error.message };

    // Map Data
    const mappedResep = data.map((item: any) => ({
      id: item.id,
      name: item.name,
      en_name: item.en_name,
      reseptype: item.type, 
      classtype: item.class,
      picture: item.picture
    }));

    return new Response(
      JSON.stringify({
        is_success: true,
        data: mappedResep
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