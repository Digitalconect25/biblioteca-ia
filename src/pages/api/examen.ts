import type { APIRoute } from 'astro';
import examenesData from '../../data/examenes.json';
import { originPermitido } from '../../lib/seguridad';

export const prerender = false;

const examenes = examenesData as Record<
  string,
  { preguntas: { p: string; o: string[]; c: number }[] }
>;

const json = (data: unknown, status = 200) =>
  new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json' },
  });

// Rate limiting básico en memoria (best-effort: por instancia serverless).
// Evita reenvíos masivos del examen desde una misma cuenta.
const LIMITE = 8;
const VENTANA_MS = 60_000;
const intentosPorUsuario = new Map<string, number[]>();

function pasaRateLimit(userId: string): boolean {
  const ahora = Date.now();
  const previos = (intentosPorUsuario.get(userId) || []).filter((t) => ahora - t < VENTANA_MS);
  if (previos.length >= LIMITE) {
    intentosPorUsuario.set(userId, previos);
    return false;
  }
  previos.push(ahora);
  intentosPorUsuario.set(userId, previos);
  return true;
}

// Registra un intento de examen (calificado en el servidor) y, si aprueba (>=80%),
// emite el certificado del curso. Nunca confía en el puntaje del cliente.
export const POST: APIRoute = async ({ request, locals }) => {
  if (!originPermitido(request)) return json({ error: 'Origin no permitido' }, 403);

  const { user, supabase } = locals;
  if (!user || !supabase) return json({ error: 'No autenticado' }, 401);

  if (!pasaRateLimit(user.id)) {
    return json({ error: 'Demasiados intentos. Esperá un momento.' }, 429);
  }

  let body: { curso?: unknown; respuestas?: unknown };
  try {
    body = await request.json();
  } catch {
    return json({ error: 'JSON inválido' }, 400);
  }

  const slug = typeof body.curso === 'string' ? body.curso : '';
  const respuestas = Array.isArray(body.respuestas) ? body.respuestas : null;
  const examen = examenes[slug];
  if (!examen) return json({ error: 'Examen no encontrado' }, 404);
  if (!respuestas || respuestas.length !== examen.preguntas.length) {
    return json({ error: 'Respuestas incompletas' }, 400);
  }

  // Resolver el curso (uuid) por slug.
  const { data: curso, error: cErr } = await supabase
    .from('courses')
    .select('id')
    .eq('slug', slug)
    .single();
  if (cErr || !curso) return json({ error: 'Curso no encontrado' }, 404);

  // Calificación en el servidor contra la clave correcta.
  let correctas = 0;
  examen.preguntas.forEach((preg, i) => {
    if (Number(respuestas[i]) === preg.c) correctas++;
  });
  const total = examen.preguntas.length;
  const puntaje = Math.round((correctas * 100) / total);
  const aprobado = puntaje >= 80;

  const { error: aErr } = await supabase.from('exam_attempts').insert({
    user_id: user.id,
    course_id: curso.id,
    puntaje,
    aprobado,
  });
  if (aErr) return json({ error: 'No se pudo registrar el intento' }, 500);

  let certificado: { codigo: string } | null = null;
  if (aprobado) {
    // ¿Ya tiene certificado de este curso?
    const { data: previo } = await supabase
      .from('certificates')
      .select('codigo')
      .eq('user_id', user.id)
      .eq('course_id', curso.id)
      .maybeSingle();

    if (previo) {
      certificado = { codigo: previo.codigo };
    } else {
      const codigo = 'CNX-' + globalThis.crypto.randomUUID().replace(/-/g, '').slice(0, 10).toUpperCase();
      const { data: nuevo, error: certErr } = await supabase
        .from('certificates')
        .insert({ user_id: user.id, course_id: curso.id, codigo })
        .select('codigo')
        .single();
      if (!certErr && nuevo) certificado = { codigo: nuevo.codigo };
    }
  }

  return json({ ok: true, aprobado, puntaje, total, correctas, certificado });
};
