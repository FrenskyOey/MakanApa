# Supabase Edge Functions for MakanApa 🍳

This folder contains all **Supabase Edge Functions** used in the MakanApa project.  
These serverless functions are written in **TypeScript** and run on **Deno**.

---

## 1. AI-Assisted Development

All Edge Function code in this folder was **generated with the help of AI**.  
However, each function has been **carefully reviewed, guided, and refined by me**, the developer.  

- I define the **requests**, **expected responses**, and **business logic** requirements.  
- AI generates the initial function code based on those instructions.  
- I **audit, test, and modify** the AI output to ensure correctness, security, and maintainability.
- 
## 2. Environment Variables & Secrets

Before deploying or running these functions, you must configure the necessary secrets in your Supabase project. These environment variables are critical for database connections and authentication.

### 🔑 Required Secrets
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

## 3. Deployment

### 🚀 Deployment
To deploy just copy index.ts to edge function in supabase dashboard


## 🚀  Deployment
