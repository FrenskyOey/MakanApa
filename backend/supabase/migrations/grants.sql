-- ============================================================
-- Makan Apa - Permission Schema
-- ============================================================

-- public
-- 1. Set the owner of the schema
ALTER SCHEMA public OWNER TO pg_database_owner;

-- 2. Grant USAGE and CREATE to the owner (pg_database_owner)
-- This is typically implicit or set by the initial setup.
-- If you need to explicitly define it:
GRANT USAGE, CREATE ON SCHEMA public TO pg_database_owner;

-- 3. Grant USAGE to the standard Supabase roles and the 'postgres' user
-- Note: 'anon' is the unauthenticated role, 'authenticated' is the logged-in user role.
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
GRANT USAGE ON SCHEMA public TO postgres;

-- 4. Grant USAGE to PUBLIC
-- The '=U/pg_database_owner' line translates to granting USAGE to the PUBLIC pseudo-role.
GRANT USAGE ON SCHEMA public TO PUBLIC;

-- food
-- 1. Set the owner of the schema
ALTER SCHEMA food OWNER TO postgres;

-- 2. Grant USAGE and CREATE to the owner (postgres)
-- This grants the owner the ability to use the schema and create new objects (tables, functions, etc.) within it.
GRANT USAGE, CREATE ON SCHEMA food TO postgres;

-- 3. Grant USAGE to the standard Supabase roles
-- This is a secure setup, allowing the standard roles to reference and use objects (like tables) in the 'food' schema,
-- but preventing them from creating new objects (like new tables or functions) themselves.
GRANT USAGE ON SCHEMA food TO anon;
GRANT USAGE ON SCHEMA food TO authenticated;
GRANT USAGE ON SCHEMA food TO service_role;

-- plan
-- 1. Set the owner of the schema
ALTER SCHEMA plan OWNER TO postgres;

-- 2. Grant USAGE and CREATE to the owner (postgres)
-- This allows the 'postgres' role to create new objects (tables, functions, etc.) within the schema.
GRANT USAGE, CREATE ON SCHEMA plan TO postgres;

-- 3. Grant USAGE to the standard application roles
-- This allows unauthenticated (anon) and authenticated users to reference objects (like tables)
-- within the 'plan' schema, but prevents them from creating new objects.
GRANT USAGE ON SCHEMA plan TO anon;
GRANT USAGE ON SCHEMA plan TO authenticated;

