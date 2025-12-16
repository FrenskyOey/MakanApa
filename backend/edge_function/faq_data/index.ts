import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'npm:@supabase/supabase-js@2';
Deno.serve(async (req)=>{
  try {
    if (req.method !== 'GET') {
      return new Response(JSON.stringify({
        error_code: 405,
        is_success: false,
        error_message: 'Method Not Allowed'
      }), {
        status: 405,
        headers: {
          'Content-Type': 'application/json'
        }
      });
    }
    const authHeader = req.headers.get('authorization') || '';
    if (!authHeader.startsWith('Bearer ')) {
      return new Response(JSON.stringify({
        error_code: 401,
        is_success: false,
        error_message: 'Missing or invalid Authorization header'
      }), {
        status: 401,
        headers: {
          'Content-Type': 'application/json'
        }
      });
    }
    const userToken = authHeader.slice('Bearer '.length);
    const SUPABASE_URL = Deno.env.get('SUPABASE_URL');
    const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY');
    if (!SUPABASE_URL) {
      return new Response(JSON.stringify({
        error_code: 500,
        is_success: false,
        error_message: 'SUPABASE_URL not configured'
      }), {
        status: 500,
        headers: {
          'Content-Type': 'application/json'
        }
      });
    }
    if (!SUPABASE_ANON_KEY) {
      return new Response(JSON.stringify({
        error_code: 500,
        is_success: false,
        error_message: 'SUPABASE_ANON_KEY not configured'
      }), {
        status: 500,
        headers: {
          'Content-Type': 'application/json'
        }
      });
    }
    const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
      global: {
        headers: {
          Authorization: `Bearer ${userToken}`
        }
      }
    });
    const { data: userData, error: userErr } = await supabase.auth.getUser();
    if (userErr || !userData?.user) {
      return new Response(JSON.stringify({
        error_code: 401,
        is_success: false,
        error_message: 'Invalid or expired token'
      }), {
        status: 401,
        headers: {
          'Content-Type': 'application/json'
        }
      });
    }
    const { data, error } = await supabase.from('faq').select('id,question,answer').order('id', {
      ascending: true
    });
    if (error) {
      if (error.message && /relation .* does not exist|not found|could not find/i.test(error.message)) {
        return new Response(JSON.stringify({
          error_code: 404,
          is_success: false,
          error_message: 'Table not founds'
        }), {
          status: 404,
          headers: {
            'Content-Type': 'application/json'
          }
        });
      }
      return new Response(JSON.stringify({
        error_code: error.status || 500,
        is_success: false,
        error_message: error.message || 'Failed to fetch data'
      }), {
        status: error.status || 502,
        headers: {
          'Content-Type': 'application/json'
        }
      });
    }
    return new Response(JSON.stringify({
      is_success: true,
      data: data ?? []
    }), {
      status: 200,
      headers: {
        'Content-Type': 'application/json'
      }
    });
  } catch (err) {
    console.error('Unhandled error in faq_data:', err);
    return new Response(JSON.stringify({
      error_code: 500,
      is_success: false,
      error_message: 'Internal server error'
    }), {
      status: 500,
      headers: {
        'Content-Type': 'application/json'
      }
    });
  }
});
