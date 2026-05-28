import { createBrowserClient } from '@supabase/ssr';

// Cliente para el navegador. Usa la anon key (pública por diseño): la seguridad
// real la dan las políticas RLS en Supabase. Comparte la sesión por cookies con
// el servidor gracias a @supabase/ssr.
export const supabaseBrowser = createBrowserClient(
  import.meta.env.PUBLIC_SUPABASE_URL,
  import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
);
