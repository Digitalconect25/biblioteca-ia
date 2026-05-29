// Defensa CSRF "cinturón y tirantes". Las cookies de Supabase ya son SameSite=Lax
// (bloquean la mayoría de los POST cross-site), pero validar Origin en los
// endpoints es una segunda línea barata y explícita.

const ORIGENES_PERMITIDOS = new Set<string>([
  'https://academia.conectanex.com',
  'https://biblioteca-ia.vercel.app',
  'http://localhost:4321',
  'http://127.0.0.1:4321',
]);

export function originPermitido(request: Request): boolean {
  const origin = request.headers.get('origin');
  // Algunos navegadores no envían Origin en ciertos casos same-origin: confiamos
  // ahí en SameSite=Lax. Si llega Origin, exigimos que esté en la lista.
  if (!origin) return true;
  return ORIGENES_PERMITIDOS.has(origin);
}
