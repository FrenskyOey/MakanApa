-- ============================================================
-- Makan Apa - Database Schema
-- Row Level Security Policies
-- ============================================================

-- ------------------------------------------------------------
-- food.Bahan
-- ------------------------------------------------------------

alter table food."Bahan"
enable row level security;

create policy "Enable read access for all users"
on food."Bahan"
for select
to public
using (true);

-- ------------------------------------------------------------
-- food.Resep
-- ------------------------------------------------------------

alter table food."Resep"
enable row level security;

create policy "Enable insert for authenticated users only"
on food."Resep"
for insert
to authenticated
with check (true);

create policy "Enable read access for all users"
on food."Resep"
for select
to public
using (true);

-- ------------------------------------------------------------
-- food.ResepDetail
-- ------------------------------------------------------------

alter table food."ResepDetail"
enable row level security;

create policy "Enable insert for authenticated users only"
on food."ResepDetail"
for insert
to authenticated
with check (true);

create policy "Enable read access for all users"
on food."ResepDetail"
for select
to public
using (true);

-- ------------------------------------------------------------
-- food.Resep_Bookmark
-- ------------------------------------------------------------

alter table food."Resep_Bookmark"
enable row level security;

-- Insert own bookmark
create policy "Enable insert for users based on user_id"
on food."Resep_Bookmark"
for insert
to public
with check (auth.uid() = user_id);

-- Read own bookmarks
create policy "Enable users to view their own data only"
on food."Resep_Bookmark"
for select
to authenticated
using (auth.uid() = user_id);

-- Update own bookmarks
create policy "Users can update their own bookmarks"
on food."Resep_Bookmark"
for update
to public
using (auth.uid() = user_id);

-- Delete own bookmarks
create policy "Enable delete for users based on user_id"
on food."Resep_Bookmark"
for delete
to public
using (auth.uid() = user_id);