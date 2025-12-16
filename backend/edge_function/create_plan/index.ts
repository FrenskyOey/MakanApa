import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Helper: Parse "DD-MM-YYYY" to JS Date
function parseDateString(dateStr: string): Date {
  const parts = dateStr.split('-');
  return new Date(parseInt(parts[2]), parseInt(parts[1]) - 1, parseInt(parts[0]));
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

    // 2. Parse Input
    const { start_date, end_date, plan } = await req.json()

    if (!start_date || !end_date || !plan || !Array.isArray(plan)) {
      throw { code: 'INVALID_INPUT', message: 'Missing required fields' };
    }

    // 3. Convert Dates for Group
    const startDateObj = parseDateString(start_date);
    const endDateObj = parseDateString(end_date);

    if (endDateObj < startDateObj) {
        throw { code: 'INVALID_DATE_RANGE', message: 'End date must be after start date' };
    }

    // 4. STEP A: Create the Group
    const { data: groupData, error: groupError } = await supabaseClient
      .schema('plan')
      .from('group')
      .insert({
        user_id: user.id,
        start_date: startDateObj.toISOString(),
        start_timestamp: startDateObj.getTime(), 
        end_date: endDateObj.toISOString(),
        end_timestamp: endDateObj.getTime()      
      })
      .select()
      .single();

    if (groupError) throw { code: 'DB_ERROR_GROUP', message: groupError.message };

    const newGroupId = groupData.id;

    // 5. STEP B: Prepare Meal Data
    const mealInserts = [];
    
    try {
        for (const item of plan) {
            const itemDateObj = parseDateString(item.date);

            // Validation: Date Range
            itemDateObj.setHours(0,0,0,0);
            const rangeStart = new Date(startDateObj); rangeStart.setHours(0,0,0,0);
            const rangeEnd = new Date(endDateObj); rangeEnd.setHours(0,0,0,0);

            if (itemDateObj < rangeStart || itemDateObj > rangeEnd) {
                throw new Error(`Date ${item.date} is outside the group range`);
            }

            mealInserts.push({
                group_id: newGroupId,
                user_id: user.id,
                dates: itemDateObj.toISOString(),
                lunch: item.lunch ?? null,   // Map input to 'lunch' column
                dinner: item.dinner ?? null  // Map input to 'dinner' column
            });
        }
    } catch (validationError: any) {
        // ROLLBACK: Delete the group if validation fails
        await supabaseClient.schema('plan').from('group').delete().eq('id', newGroupId);
        throw { code: 'VALIDATION_ERROR', message: validationError.message };
    }

    // 6. STEP C: Bulk Insert Meals
    if (mealInserts.length > 0) {
        const { error: mealError } = await supabaseClient
        .schema('plan')
        .from('meal')
        .insert(mealInserts);

        if (mealError) {
            // ROLLBACK: Delete the group if database insert fails
            await supabaseClient.schema('plan').from('group').delete().eq('id', newGroupId);
            throw { code: 'DB_ERROR_MEAL', message: mealError.message };
        }
    }

    // 7. Success Response
    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
            group_id: newGroupId,
            message: "Plan created successfully"
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