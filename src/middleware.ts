import { defineMiddleware } from 'astro:middleware';
import { createSupabaseServerClient } from './lib/supabase/server';

// Rutas que exigen sesión. Se protegen por prefijo (incluye sus subrutas).
const RUTAS_PRIVADAS = ['/dashboard', '/mi-progreso', '/certificados'];

export const onRequest = defineMiddleware(async (context, next) => {
  // Las páginas de contenido se prerenderizan en build: no hay request real ni
  // cookies, así que no instanciamos Supabase ni validamos sesión ahí.
  if (context.isPrerendered) return next();

  const supabase = createSupabaseServerClient({
    headers: context.request.headers,
    cookies: context.cookies,
  });

  // getUser() revalida el token contra el servidor de auth de Supabase (y refresca
  // la cookie si hace falta). Es más seguro que getSession(), que solo lee la cookie.
  const {
    data: { user },
  } = await supabase.auth.getUser();

  context.locals.supabase = supabase;
  context.locals.user = user;

  const path = context.url.pathname;
  const esPrivada = RUTAS_PRIVADAS.some(
    (p) => path === p || path === p + '/' || path.startsWith(p + '/'),
  );

  if (esPrivada && !user) {
    const destino = encodeURIComponent(path + context.url.search);
    return context.redirect(`/login?redirect=${destino}`, 302);
  }

  return next();
});
