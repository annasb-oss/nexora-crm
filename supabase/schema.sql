-- NEXORA CRM — initial Supabase schema
-- Run in Supabase SQL Editor after creating a project.
-- Row Level Security ensures users can only access their own records.

create extension if not exists pgcrypto;

create table if not exists public.clients (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  company text not null,
  email text,
  phone text,
  status text not null default 'Lead' check (status in ('Ativo','Lead','Inativo')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.deals (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  client_id uuid references public.clients(id) on delete set null,
  title text not null,
  value numeric(12,2) not null default 0 check (value >= 0),
  stage text not null default 'Prospecção' check (stage in ('Prospecção','Qualificação','Proposta','Negociação','Ganho','Perdido')),
  due_date date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  client_id uuid references public.clients(id) on delete set null,
  title text not null,
  due_at timestamptz,
  type text not null default 'Tarefa' check (type in ('Ligação','E-mail','Reunião','Tarefa')),
  done boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists clients_user_id_idx on public.clients(user_id);
create index if not exists deals_user_id_idx on public.deals(user_id);
create index if not exists tasks_user_id_idx on public.tasks(user_id);
create index if not exists deals_client_id_idx on public.deals(client_id);
create index if not exists tasks_client_id_idx on public.tasks(client_id);

alter table public.clients enable row level security;
alter table public.deals enable row level security;
alter table public.tasks enable row level security;

drop policy if exists "Users manage their own clients" on public.clients;
create policy "Users manage their own clients" on public.clients
  for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "Users manage their own deals" on public.deals;
create policy "Users manage their own deals" on public.deals
  for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "Users manage their own tasks" on public.tasks;
create policy "Users manage their own tasks" on public.tasks
  for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Never expose the Supabase service_role key in a browser app.
-- Use only the project's publishable/anon key on the client, with RLS enabled.
