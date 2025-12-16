-- ============================================================
-- Makan Apa - Database Schema
-- Row Level Security Policies
-- ============================================================

-- ------------------------------------------------------------
-- plan.group
-- ------------------------------------------------------------

alter table plan."group"
enable row level security;

-- Insert own group
create policy "Enable insert for users based on user_id"
on plan."group"
for insert
to public
with check (auth.uid() = user_id);

-- Read own group
create policy "Enable users to view their own data only"
on plan."group"
for select
to authenticated
using (auth.uid() = user_id);

-- Update own group
create policy "Users can update their own data"
on plan."group"
for update
to public
using (auth.uid() = user_id);

-- Delete own group
create policy "Enable delete for users based on user_id"
on plan."group"
for delete
to public
using (auth.uid() = user_id);

-- ------------------------------------------------------------
-- plan.meal
-- ------------------------------------------------------------

alter table plan."meal"
enable row level security;

-- Insert own meal
create policy "Enable insert for users based on user_id"
on plan."meal"
for insert
to public
with check (auth.uid() = user_id);

-- Read own meal
create policy "Enable users to view their own data only"
on plan."meal"
for select
to authenticated
using (auth.uid() = user_id);

-- Update own meal
create policy "Users can update their own data"
on plan."meal"
for update
to public
using (auth.uid() = user_id);

-- Delete own meal
create policy "Enable delete for users based on user_id"
on plan."meal"
for delete
to public
using (auth.uid() = user_id);