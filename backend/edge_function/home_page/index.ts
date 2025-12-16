import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Helper: Format Date to "d-M-yyyy" (e.g., "8-12-2025")
function formatDate(date: Date): string {
  return `${date.getDate()}-${date.getMonth() + 1}-${date.getFullYear()}`;
}

// Helper: Get Monday of the current week
function getCurrentMonday(d: Date): Date {
  const date = new Date(d);
  const day = date.getDay(); 
  const diff = date.getDate() - day + (day === 0 ? -6 : 1); // adjust when day is sunday
  date.setDate(diff);
  date.setHours(0, 0, 0, 0); // Normalize time
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

    // 2. Calculate Date Ranges
    const today = new Date();
    const currentMonday = getCurrentMonday(today);
    
    // Generate the 5 Mondays we care about (Current + 4 Future)
    const targetMondays: Date[] = [];
    for (let i = 0; i < 5; i++) {
        const d = new Date(currentMonday);
        d.setDate(currentMonday.getDate() + (i * 7));
        targetMondays.push(d);
    }

    const searchStart = targetMondays[0].toISOString(); // Week 0 (Current)
    const searchEnd = targetMondays[4].toISOString();   // Week 4

    // 3. Fetch All Groups in this Range
    // We search for any group where start_date is one of our Mondays
    const { data: groups, error: groupError } = await supabaseClient
        .schema('plan')
        .from('group')
        .select('id, start_date, end_date')
        .eq('user_id', user.id)
        .gte('start_date', searchStart)
        .lte('start_date', searchEnd);

    if (groupError) throw { code: 'DB_ERROR', message: groupError.message };

    // Map found groups by their date string for easy lookup
    // Key: "8-12-2025", Value: Group Object
    const groupsByDate: Record<string, any> = {};
    groups.forEach((g: any) => {
        const d = new Date(g.start_date);
        groupsByDate[formatDate(d)] = g;
    });

    // --- BUILD RESPONSE PARTS ---

    let current_week_plan = null;
    const upcoming_plan = [];
    const available_plan = [];

    // Part A: Process Current Week (Index 0)
    const currentMondayStr = formatDate(targetMondays[0]);
    const currentGroup = groupsByDate[currentMondayStr];

    if (currentGroup) {
        // CHANGED: We now query 'meal_details_view' instead of 'meal'
        const { data: meals, error: mealError } = await supabaseClient
            .schema('plan')
            .from('meal_details_view') 
            .select('*') // Select everything, the view handles the joins
            .eq('group_id', currentGroup.id)
            .order('dates', { ascending: true });

        if (mealError) throw { code: 'DB_ERROR_MEAL', message: mealError.message };

        // CHANGED: Map the flat view data to your nested JSON structure
        const formattedMeals = meals.map((m: any) => {
            const dateObj = new Date(m.dates);
            const mealObj: any = {
                date: formatDate(dateObj)
            };
            
            // Map Lunch manually from flat columns
            if (m.lunch_id) {
                mealObj.lunch = {
                    id: m.lunch_id,
                    name: m.lunch_name,
                    en_name: m.lunch_en_name,
                    reseptype: m.lunch_type,
                    classtype: m.lunch_class,
                    picture: m.lunch_picture
                };
            }

            // Map Dinner manually from flat columns
            if (m.dinner_id) {
                mealObj.dinner = {
                    id: m.dinner_id,
                    name: m.dinner_name,
                    en_name: m.dinner_en_name,
                    reseptype: m.dinner_type,
                    classtype: m.dinner_class,
                    picture: m.dinner_picture
                };
            }

            return mealObj;
        });

        const endDateObj = new Date(currentGroup.end_date);
        current_week_plan = {
            group_id: currentGroup.id,
            start_date: formatDate(new Date(currentGroup.start_date)),
            end_date: formatDate(endDateObj),
            meal_plan: formattedMeals
        };
    } else {
        // If current week has no plan, add it to available
        available_plan.push({ start_date: currentMondayStr });
    }

    // Part B: Process Future Weeks (Index 1 to 4)
    for (let i = 1; i < 5; i++) {
        const dateStr = formatDate(targetMondays[i]);
        const group = groupsByDate[dateStr];

        if (group) {
            upcoming_plan.push({
                group_id: group.id,
                start_date: dateStr
            });
        } else {
            available_plan.push({
                start_date: dateStr
            });
        }
    }

    return new Response(
      JSON.stringify({
        is_success: true,
        data: {
            current_week_plant: current_week_plan,
            upcoming_plan: upcoming_plan,
            avaible_plan: available_plan
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