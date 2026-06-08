create table if not exists public.kanban_state (
    id text primary key,
    payload jsonb not null,
    updated_at timestamptz not null default now()
);

alter table public.kanban_state enable row level security;

drop policy if exists "Public can read kanban state" on public.kanban_state;
create policy "Public can read kanban state"
on public.kanban_state
for select
to anon
using (true);

drop policy if exists "Public can insert kanban state" on public.kanban_state;
create policy "Public can insert kanban state"
on public.kanban_state
for insert
to anon
with check (true);

drop policy if exists "Public can update kanban state" on public.kanban_state;
create policy "Public can update kanban state"
on public.kanban_state
for update
to anon
using (true)
with check (true);
