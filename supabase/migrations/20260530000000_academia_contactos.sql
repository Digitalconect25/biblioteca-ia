-- Tabla del formulario de contacto público de la Academia.
-- Namespaced con prefijo academia_ para no chocar con otras apps del proyecto
-- compartido. RLS estricta: anon puede INSERT solo; lectura/edición solo
-- service_role (panel de Supabase).

create table if not exists public.academia_contactos (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  email text not null,
  tipo text not null default 'otra',
  mensaje text not null,
  ip text,
  user_agent text,
  created_at timestamptz default now(),
  constraint contactos_nombre_len  check (length(nombre) between 2 and 120),
  constraint contactos_email_len   check (length(email) between 5 and 200),
  constraint contactos_email_fmt   check (email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
  constraint contactos_tipo_ok     check (tipo in ('sugerencia','error','colaboracion','otra')),
  constraint contactos_mensaje_len check (length(mensaje) between 5 and 5000)
);

create index if not exists idx_contactos_created
  on public.academia_contactos(created_at desc);

alter table public.academia_contactos enable row level security;

drop policy if exists "contactos_insert_publico" on public.academia_contactos;
create policy "contactos_insert_publico" on public.academia_contactos
  for insert to anon, authenticated
  with check (
    length(nombre) between 2 and 120 and
    length(email) between 5 and 200 and
    length(mensaje) between 5 and 5000 and
    tipo in ('sugerencia','error','colaboracion','otra')
  );
