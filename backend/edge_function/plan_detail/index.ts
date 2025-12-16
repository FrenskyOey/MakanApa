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

// Helper: Add days to a date
function addDays(date: Date, days: number): Date {
  const result = new Date(date);
  result.setDate(result.getDate() + days);
  return result;
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

    // 2. Input
    const { group_id } = await req.json()
    if (!group_id) throw { code: 'INVALID_INPUT', message: 'group_id is required' };

    // 3. Fetch Group Header
    const { data: group, error: groupError } = await supabaseClient
        .schema('plan')
        .from('group')
        .select('id, start_date, end_date')
        .eq('id', group_id)
        .eq('user_id', user.id)
        .single();

    if (groupError || !group) throw { code: 'NOT_FOUND', message: 'Plan not found' };

    // 4. Fetch Meals (USING THE VIEW)
    // We query the flat view plan.meal_details_view
    const { data: meals, error: mealError } = await supabaseClient
        .schema('plan')
        .from('meal_details_view')
        .select('*') 
        .eq('group_id', group_id);

    if (mealError) throw { code: 'DB_ERROR_MEAL', message: mealError.message };

    // 5. Map Meals for Lookup
    // Key: "8-12-2025", Value: Flat View Data Row
    const mealsByDate: Record<string, any> = {};
    meals.forEach((m: any) => {
        const d = new Date(m.dates);
        mealsByDate[formatDate(d)] = m;
    });

    // 6. Build the Full Range List
    // We iterate from start_date to end_date to ensure every day is represented
    const fullPlanList = [];
    const startDateObj = new Date(group.start_date);
    const endDateObj = new Date(group.end_date);
    
    // Calculate difference in days to loop correctly
    const diffTime = Math.abs(endDateObj.getTime() - startDateObj.getTime());
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 

    for (let i = 0; i <= diffDays; i++) {
        const currentDate = addDays(startDateObj, i);
        const dateStr = formatDate(currentDate);
        
        // Check if we have data for this specific date
        const m = mealsByDate[dateStr];

        const dayItem: any = {
            date: dateStr
        };

        if (m) {
            // Map Lunch from Flat View Columns
            if (m.lunch_id) {
                dayItem.lunch = {
                    id: m.lunch_id,
                    name: m.lunch_name,
                    en_name: m.lunch_en_name,
                    reseptype: m.lunch_type,
                    classtype: m.lunch_class,
                    picture: m.lunch_picture
                };
            }

            // Map Dinner from Flat View Columns
            if (m.dinner_id) {
                dayItem.dinner = {
                    id: m.dinner_id,
                    name: m.dinner_name,
                    en_name: m.dinner_en_name,
                    reseptype: m.dinner_type,
                    classtype: m.dinner_class,
                    picture: m.dinner_picture
                };
            }
        }

        fullPlanList.push(dayItem);
    }

    // 7. Response
    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
            group_id: group.id,
            start_date: formatDate(startDateObj),
            end_date: formatDate(endDateObj),
            meal_plan: fullPlanList
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