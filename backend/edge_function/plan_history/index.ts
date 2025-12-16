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

    // 2. Calculate Cut-off Date (Start of Current Week)
    const today = new Date();
    const currentWeekStart = getCurrentMonday(today);
    
    // We want history: Groups that ended BEFORE the current week started
    // Format to ISO string for DB comparison
    const cutOffDateISO = currentWeekStart.toISOString();

    // 3. Query History
    const { data: groups, error } = await supabaseClient
        .schema('plan')
        .from('group')
        .select('id, start_date, end_date')
        .eq('user_id', user.id)
        .lt('end_date', cutOffDateISO) // Less than Current Week Start
        .order('end_date', { ascending: false }); // Sort Descending (Newest history first)

    if (error) throw { code: 'DB_ERROR', message: error.message };

    // 4. Map Data
    const formattedHistory = groups.map((g: any) => ({
        groupId: g.id,
        start_date: formatDate(new Date(g.start_date)),
        end_date: formatDate(new Date(g.end_date))
    }));

    // 5. Response
    return new Response(
      JSON.stringify({
        is_success: true,
        data: formattedHistory
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