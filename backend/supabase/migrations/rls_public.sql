-- ============================================================
-- Makan Apa - Database Schema
-- Row Level Security Policies
-- ============================================================

-- ------------------------------------------------------------
-- FAQ (Public Read)
-- ------------------------------------------------------------

alter table public.faq
enable row level security;

create policy "Enable read access for all users"
on public.faq
for select
to public
using (true);

-- ------------------------------------------------------------
-- User Profile
-- ------------------------------------------------------------

alter table public.user_profile
enable row level security;

-- Insert own profile
create policy "Users can insert their own profile"
on public.user_profile
for insert
to public
with check (auth.uid() = uid);

-- Read own profile
create policy "Users can read their own profile"
on public.user_profile
for select
to public
using (auth.uid() = uid);

-- Update own profile
create policy "Users can update their own profile"
on public.user_profile
for update
to public
using (auth.uid() = uid)
with check (auth.uid() = uid);

