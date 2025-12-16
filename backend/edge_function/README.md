# Edge Functions – Backend Logic

This directory contains the server-side logic for **Makan Apa**, implemented using [Supabase Edge Functions](https://supabase.com/docs/guides/functions) (Deno).

## 🔑 Environment Variables & Secrets

Before deploying or running these functions, you must configure the necessary secrets in your Supabase project. These environment variables are critical for database connections and authentication.

### Required Secrets
Please refer to **`supabase_env.png`** (included in this folder) for the exact list of keys required.

!Supabase Environment Secrets

You can set these secrets via the Supabase Dashboard or CLI:

```bash
supabase secrets set SUPABASE_URL=your_project_url
supabase secrets set SUPABASE_ANON_KEY=your_anon_key
supabase secrets set SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
supabase secrets set SUPABASE_DB_URL=your_postgres_connection_string
```

---

## 🚀  Deployment

### Deployment
To deploy just copy index.ts to edge function in supabase dashboard