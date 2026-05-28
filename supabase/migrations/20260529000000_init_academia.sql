-- Academia de IA ConectaNex — esquema de autenticación + progreso.
--
-- El contenido (cursos/lecciones) sigue viviendo en Markdown (Content Collections).
-- Aquí guardamos un espejo mínimo (courses/lessons) para contar el avance y enlazar
-- por slug, más los datos por usuario. RLS activado en todas las tablas.
--
-- gen_random_uuid() proviene de pgcrypto, habilitado por defecto en Supabase.

-- ============================================================
-- Tablas de contenido (espejo del Markdown)
-- ============================================================

create table if not exists public.courses (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  titulo text not null,
  descripcion text,
  orden int default 0,
  publicado boolean default true
);

create table if not exists public.lessons (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references public.courses(id) on delete cascade,
  -- Puntero al ítem del catálogo en Markdown, formato "col/id" (ej. "ias/chatgpt").
  -- Une el espejo de la BD con el contenido real que renderiza Astro.
  ref text,
  titulo text not null,
  contenido text,
  orden int default 0,
  duracion_min int,
  unique (course_id, ref)
);

-- ============================================================
-- Perfil de usuario (1:1 con auth.users)
-- ============================================================

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  nombre text,
  avatar_url text,
  created_at timestamptz default now()
);

-- ============================================================
-- Datos por usuario
-- ============================================================

create table if not exists public.enrollments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  fecha_inicio timestamptz default now(),
  unique (user_id, course_id)
);

create table if not exists public.lesson_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  completada boolean default false,
  fecha_completada timestamptz,
  unique (user_id, lesson_id)
);

create table if not exists public.exam_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  puntaje int,
  aprobado boolean,
  fecha timestamptz default now()
);

create table if not exists public.certificates (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  codigo text unique not null,
  emitido_en timestamptz default now(),
  url_pdf text,
  -- Un solo certificado por usuario y curso.
  unique (user_id, course_id)
);

-- Índices para las búsquedas más frecuentes.
create index if not exists idx_lessons_course on public.lessons(course_id);
create index if not exists idx_enrollments_user on public.enrollments(user_id);
create index if not exists idx_lesson_progress_user on public.lesson_progress(user_id);
create index if not exists idx_exam_attempts_user on public.exam_attempts(user_id);
create index if not exists idx_certificates_user on public.certificates(user_id);

-- ============================================================
-- Row Level Security
-- ============================================================

alter table public.courses          enable row level security;
alter table public.lessons          enable row level security;
alter table public.profiles         enable row level security;
alter table public.enrollments      enable row level security;
alter table public.lesson_progress  enable row level security;
alter table public.exam_attempts    enable row level security;
alter table public.certificates     enable row level security;

-- courses: lectura pública (anon + authenticated) solo de los publicados.
drop policy if exists "courses_select_publicados" on public.courses;
create policy "courses_select_publicados" on public.courses
  for select to anon, authenticated
  using (publicado = true);

-- lessons: lectura pública si el curso padre está publicado.
drop policy if exists "lessons_select_publicados" on public.lessons;
create policy "lessons_select_publicados" on public.lessons
  for select to anon, authenticated
  using (exists (
    select 1 from public.courses c
    where c.id = lessons.course_id and c.publicado = true
  ));

-- profiles: cada usuario ve / edita / inserta solo el suyo.
drop policy if exists "profiles_select_own" on public.profiles;
create policy "profiles_select_own" on public.profiles
  for select to authenticated using (id = auth.uid());

drop policy if exists "profiles_update_own" on public.profiles;
create policy "profiles_update_own" on public.profiles
  for update to authenticated using (id = auth.uid()) with check (id = auth.uid());

drop policy if exists "profiles_insert_own" on public.profiles;
create policy "profiles_insert_own" on public.profiles
  for insert to authenticated with check (id = auth.uid());

-- enrollments / lesson_progress / exam_attempts / certificates:
-- el usuario solo puede ver y escribir sus propias filas (todas las operaciones).
drop policy if exists "enrollments_own" on public.enrollments;
create policy "enrollments_own" on public.enrollments
  for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "lesson_progress_own" on public.lesson_progress;
create policy "lesson_progress_own" on public.lesson_progress
  for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "exam_attempts_own" on public.exam_attempts;
create policy "exam_attempts_own" on public.exam_attempts
  for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "certificates_own" on public.certificates;
create policy "certificates_own" on public.certificates
  for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

-- ============================================================
-- Trigger: crear el profile automáticamente al registrarse
-- ============================================================

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, nombre)
  values (new.id, coalesce(new.raw_user_meta_data->>'nombre', ''))
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
