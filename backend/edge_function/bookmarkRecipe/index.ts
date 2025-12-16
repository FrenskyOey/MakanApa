import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // 1. CORS Handle
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    // 2. Auth Check
    const { data: { user }, error: authError } = await supabaseClient.auth.getUser()
    if (authError || !user) {
      throw { code: 'UNAUTHORIZED', message: 'User is not authenticated' };
    }

    // 3. Input Validation
    const { recipe_id } = await req.json()
    if (!recipe_id) {
      throw { code: 'INVALID_INPUT', message: 'recipe_id is required' };
    }

    // 4. Check for existing bookmark
    // We use .maybeSingle() because it returns null instead of throwing error if no data found
    const { data: existingData, error: fetchError } = await supabaseClient
      .schema('food')
      .from('Resep_Bookmark')
      .select('id, is_bookmarked')
      .eq('recipe_id', recipe_id)
      .eq('user_id', user.id) // Ensure we check specific user (though RLS likely covers this)
      .maybeSingle();

    if (fetchError) {
      throw { code: 'DB_ERROR_FETCH', message: fetchError.message };
    }

    let resultStatus = false;

    // 5. Logic: Update or Insert
    if (existingData) {
      // --- A. UPDATE (Toggle) ---
      // If it was true, make it false. If false, make it true.
      const newStatus = !existingData.is_bookmarked;

      const { error: updateError } = await supabaseClient
        .schema('food')
        .from('Resep_Bookmark')
        .update({ 
            is_bookmarked: newStatus,
            created_at: new Date() // Optional: Update timestamp to show it was recently interacted with
        })
        .eq('id', existingData.id);

      if (updateError) throw { code: 'DB_ERROR_UPDATE', message: updateError.message };
      
      resultStatus = newStatus;

    } else {
      // --- B. INSERT (New Bookmark) ---
      // Since your table defaults user_id to auth.uid(), we technically don't need to send it,
      // but sending it explicitly ensures clarity.
      const { error: insertError } = await supabaseClient
        .schema('food')
        .from('Resep_Bookmark')
        .insert({
          user_id: user.id,
          recipe_id: recipe_id,
          is_bookmarked: true
        });

      if (insertError) throw { code: 'DB_ERROR_INSERT', message: insertError.message };
      
      resultStatus = true;
    }

    // 6. Return Response
    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
            recipe_id: recipe_id,
            is_bookmarked: resultStatus,
            action_type: resultStatus ? 'bookmarked' : 'unbookmarked'
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