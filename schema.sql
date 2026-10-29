-- Run this once in Supabase: SQL Editor > New query > paste > Run.
create table if not exists public.items (
  id          text primary key,
  list_id     text not null,
  name        text not null,
  qty         numeric not null default 1,
  unit        text not null default 'pcs',
  received    numeric not null default 0,
  created_at  bigint not null default 0,
  deleted     boolean not null default false,
  updated_at  timestamptz not null default now()
);
create index if not exists items_list_idx on public.items (list_id);

alter table public.items enable row level security;

-- Read, add and edit are allowed. There is deliberately NO delete policy,
-- so rows can never be removed through the website. "Delete" only moves an
-- item to Trash (deleted = true), and it can be restored.
create policy "read items"   on public.items for select to anon using (true);
create policy "add items"    on public.items for insert to anon with check (true);
create policy "update items" on public.items for update to anon using (true) with check (true);
