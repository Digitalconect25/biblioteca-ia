import { createServerClient, parseCookieHeader } from '@supabase/ssr';
import { createClient } from '@supabase/supabase-js';
import type { AstroCookies } from 'astro';

// Cliente con sesión para rutas renderizadas en el servidor. Lee la sesión de la
// cookie entrante y reescribe las cookies (httpOnly) cuando Supabase refresca el
// token. Respeta RLS: solo ve los datos que la sesión del usuario tiene permitido.
export function createSupabaseServerClient({
  headers,
  cookies,
}: {
  headers: Headers;
  cookies: AstroCookies;
}) {
  return createServerClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
    {
      cookies: {
        getAll() {
          return parseCookieHeader(headers.get('Cookie') ?? '').map(
            ({ name, value }) => ({ name, value: value ?? '' }),
          );
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) =>
            cookies.set(name, value, options),
          );
        },
      },
    },
  );
}

// Cliente administrador (service_role): solo para tareas server-side que deben
// saltarse RLS (p. ej. emitir un certificado). NUNCA importar desde código que
// llegue al navegador. No persiste sesión.
export function createSupabaseAdmin() {
  return createClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.SUPABASE_SERVICE_ROLE_KEY,
    { auth: { persistSession: false, autoRefreshToken: false } },
  );
}
