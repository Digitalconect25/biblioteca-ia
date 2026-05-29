import type { APIRoute } from 'astro';
import { createSupabaseServerClient } from '../../lib/supabase/server';
import { originPermitido } from '../../lib/seguridad';

export const prerender = false;

const json = (data: unknown, status = 200) =>
  new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json' },
  });

const TIPOS = new Set(['sugerencia', 'error', 'colaboracion', 'otra']);
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

// Rate-limit por IP en memoria (best-effort por instancia serverless).
const LIMITE = 3;
const VENTANA_MS = 10 * 60_000; // 10 min
const intentosPorIp = new Map<string, number[]>();

function pasaRateLimit(ip: string): boolean {
  const ahora = Date.now();
  const previos = (intentosPorIp.get(ip) || []).filter((t) => ahora - t < VENTANA_MS);
  if (previos.length >= LIMITE) {
    intentosPorIp.set(ip, previos);
    return false;
  }
  previos.push(ahora);
  intentosPorIp.set(ip, previos);
  return true;
}

export const POST: APIRoute = async ({ request, cookies, clientAddress }) => {
  if (!originPermitido(request)) return json({ error: 'Origin no permitido' }, 403);

  const ip = clientAddress || 'desconocida';
  if (!pasaRateLimit(ip)) {
    return json({ error: 'Demasiadas solicitudes. Esperá unos minutos.' }, 429);
  }

  let body: any;
  try {
    body = await request.json();
  } catch {
    return json({ error: 'JSON inválido' }, 400);
  }

  // Honeypot anti-bot: campo invisible que los humanos no completan.
  // Si viene con contenido, devolvemos 200 silencioso para no soplar el truco.
  if (typeof body?.website === 'string' && body.website.length > 0) {
    return json({ ok: true });
  }

  const nombre  = (typeof body?.nombre  === 'string' ? body.nombre.trim()  : '').slice(0, 120);
  const email   = (typeof body?.email   === 'string' ? body.email.trim().toLowerCase() : '').slice(0, 200);
  const tipo    = (typeof body?.tipo    === 'string' ? body.tipo           : 'otra');
  const mensaje = (typeof body?.mensaje === 'string' ? body.mensaje.trim() : '').slice(0, 5000);

  if (nombre.length < 2) return json({ error: 'Nombre demasiado corto' }, 400);
  if (!EMAIL_RE.test(email)) return json({ error: 'Email inválido' }, 400);
  if (!TIPOS.has(tipo)) return json({ error: 'Tipo inválido' }, 400);
  if (mensaje.length < 5) return json({ error: 'El mensaje es muy corto' }, 400);

  const supabase = createSupabaseServerClient({ headers: request.headers, cookies });
  const userAgent = request.headers.get('user-agent')?.slice(0, 500) || null;

  const { error } = await supabase.from('academia_contactos').insert({
    nombre,
    email,
    tipo,
    mensaje,
    ip,
    user_agent: userAgent,
  });
  if (error) return json({ error: 'No se pudo enviar. Probá de nuevo.' }, 500);

  return json({ ok: true });
};
