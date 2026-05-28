import type { APIRoute } from 'astro';
import { createSupabaseServerClient } from '../lib/supabase/server';

export const prerender = false;

// Cierra la sesión (borra las cookies de auth) y vuelve al inicio.
const handler: APIRoute = async ({ request, cookies, redirect }) => {
  const supabase = createSupabaseServerClient({ headers: request.headers, cookies });
  await supabase.auth.signOut();
  return redirect('/', 302);
};

export const GET = handler;
export const POST = handler;
