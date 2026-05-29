import type { APIRoute } from 'astro';
import { originPermitido } from '../../lib/seguridad';

export const prerender = false;

const json = (data: unknown, status = 200) =>
  new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json' },
  });

const esUuid = (v: unknown): v is string =>
  typeof v === 'string' &&
  /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(v);

// Marca/desmarca una lección como completada para el usuario de la sesión.
// El user_id SIEMPRE sale de la sesión, nunca del cuerpo del request.
export const POST: APIRoute = async ({ request, locals }) => {
  if (!originPermitido(request)) return json({ error: 'Origin no permitido' }, 403);

  const { user, supabase } = locals;
  if (!user || !supabase) return json({ error: 'No autenticado' }, 401);

  let body: { lesson_id?: unknown; completada?: unknown };
  try {
    body = await request.json();
  } catch {
    return json({ error: 'JSON inválido' }, 400);
  }

  const lessonId = body.lesson_id;
  const completada = body.completada !== false; // por defecto true
  if (!esUuid(lessonId)) return json({ error: 'lesson_id inválido' }, 400);

  // Resolver el curso de la lección para auto-inscribir al alumno.
  const { data: lesson, error: lErr } = await supabase
    .from('lessons')
    .select('course_id')
    .eq('id', lessonId)
    .single();
  if (lErr || !lesson) return json({ error: 'Lección no encontrada' }, 404);

  // Inscripción idempotente (al primer avance, queda inscrito en el curso).
  await supabase
    .from('enrollments')
    .upsert(
      { user_id: user.id, course_id: lesson.course_id },
      { onConflict: 'user_id,course_id', ignoreDuplicates: true },
    );

  const { error } = await supabase.from('lesson_progress').upsert(
    {
      user_id: user.id,
      lesson_id: lessonId,
      completada,
      fecha_completada: completada ? new Date().toISOString() : null,
    },
    { onConflict: 'user_id,lesson_id' },
  );
  if (error) return json({ error: 'No se pudo guardar el progreso' }, 500);

  return json({ ok: true, completada });
};
