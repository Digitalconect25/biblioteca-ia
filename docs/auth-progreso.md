# Autenticación y progreso (Supabase)

La Academia usa **Supabase** para registro, sesión y progreso por usuario.
El contenido (cursos/lecciones) sigue en Markdown; Supabase guarda los datos de
cada alumno. El sitio es estático con Astro + adaptador de Vercel: solo las rutas
con sesión se renderizan on-demand (`prerender = false`).

## 1. Variables de entorno

Tres variables (las dos `PUBLIC_` van al navegador; la `SERVICE_ROLE` es **solo
server-side**, nunca se expone):

| Variable | Dónde se usa | De dónde sale (panel Supabase) |
|---|---|---|
| `PUBLIC_SUPABASE_URL` | cliente + server | Project Settings → API → Project URL |
| `PUBLIC_SUPABASE_ANON_KEY` | cliente + server | Project Settings → API → `anon` `public` |
| `SUPABASE_SERVICE_ROLE_KEY` | solo server | Project Settings → API → `service_role` (secreta) |

### Local (`.env` en la raíz)

```bash
PUBLIC_SUPABASE_URL=https://TU-PROYECTO.supabase.co
PUBLIC_SUPABASE_ANON_KEY=eyJ...anon...
SUPABASE_SERVICE_ROLE_KEY=eyJ...service_role...
```

`.env` está en `.gitignore`: nunca se commitea. **No publiques la service_role.**

### Vercel

Project → Settings → Environment Variables. Cargá las tres con el mismo nombre
para los entornos Production, Preview y Development. Luego un nuevo deploy.

## 2. Aplicar las migraciones

El esquema (tablas + RLS + trigger) está en `supabase/migrations/`. Opciones:

- **Panel (rápido):** Supabase → SQL Editor → pegá el contenido de
  `supabase/migrations/20260529000000_init_academia.sql` y ejecutá. Después pegá
  y ejecutá `supabase/seed.sql` (cursos y lecciones).
- **CLI:** con la [CLI de Supabase](https://supabase.com/docs/guides/local-development)
  enlazada al proyecto (`supabase link`), corré `supabase db push`. Para resembrar,
  `supabase db reset` aplica migraciones + `seed.sql`.

El seed es idempotente (`ON CONFLICT`): se puede correr varias veces sin duplicar.
Si cambian los cursos en Markdown, regeneralo con `node scripts/gen-seed.mjs`.

## 3. Configurar Auth en Supabase

Authentication → URL Configuration:

- **Site URL:** `https://biblioteca-ia.vercel.app`
- **Redirect URLs:** agregá tu dominio y local para confirmación de correo y
  reset de contraseña:
  - `https://biblioteca-ia.vercel.app/login`
  - `https://biblioteca-ia.vercel.app/actualizar-password`
  - `http://localhost:4321/login`
  - `http://localhost:4321/actualizar-password`

Email confirmations (Authentication → Providers → Email): si las dejás activas,
el registro muestra "revisá tu correo". Si las desactivás, el alta entra directo.

## 4. Esquema y seguridad

Tablas: `profiles`, `courses`, `lessons`, `enrollments`, `lesson_progress`,
`exam_attempts`, `certificates`. **RLS activado en todas:**

- `courses` / `lessons`: lectura pública solo si `publicado = true`.
- `profiles`: cada quien ve/edita el suyo (`id = auth.uid()`); se crea solo con
  el trigger `handle_new_user` al registrarse.
- `enrollments`, `lesson_progress`, `exam_attempts`, `certificates`: el usuario
  solo accede a sus filas (`user_id = auth.uid()`).

Defensa en capas: el middleware valida la sesión y los endpoints
(`/api/progreso`, `/api/examen`) toman el `user_id` **de la sesión, nunca del
cliente**; RLS es la última línea. El examen se **califica en el servidor**
contra la clave de `src/data/examenes.json`, y el certificado se emite ahí
(código único) — el cliente no puede falsear la nota.

### Nota sobre las cookies de sesión

Con `@supabase/ssr` y uso del cliente en el navegador, la cookie de sesión la
lee también el JavaScript del cliente (no es `httpOnly` puro): el cliente del
navegador la necesita para consultar Supabase con RLS y mantener las páginas de
contenido estáticas (buenas para SEO/Pagefind). La seguridad real la dan RLS +
la validación server-side. Si se quisiera sesión 100% `httpOnly`, habría que
mover TODO el acceso a Supabase al servidor (login por endpoint, páginas de
curso on-demand) y se perdería el prerender de los cursos.

## 5. Páginas y endpoints

- `/registro`, `/login`, `/logout`, `/recuperar-password`, `/actualizar-password`
- `/dashboard`, `/mi-progreso`, `/certificados` (protegidas por el middleware)
- `POST /api/progreso` — marca una lección (`{ lesson_id, completada }`)
- `POST /api/examen` — registra el intento (`{ curso: slug, respuestas: number[] }`)
  y, si aprueba (≥80%), emite el certificado.
