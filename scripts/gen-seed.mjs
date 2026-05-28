// Genera supabase/seed.sql espejando los cursos/lecciones del Markdown a las
// tablas courses/lessons. Idempotente (ON CONFLICT). Correr: node scripts/gen-seed.mjs
import { readFileSync, readdirSync, writeFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import yaml from 'js-yaml';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const CONTENT = join(ROOT, 'src', 'content');

function frontmatter(file) {
  const m = readFileSync(file, 'utf8').match(/^---\r?\n([\s\S]*?)\r?\n---/);
  return m ? yaml.load(m[1]) || {} : {};
}
// Escapa un literal SQL entre comillas simples y colapsa espacios.
const sq = (v) => String(v ?? '').replace(/\s+/g, ' ').trim().replace(/'/g, "''");

// Títulos de cada ítem del catálogo, por "col/id".
const COLS = ['ias', 'skills', 'mcps', 'trucos', 'ensenanzas'];
const titulos = {};
for (const col of COLS) {
  for (const f of readdirSync(join(CONTENT, col)).filter((n) => n.endsWith('.md'))) {
    const id = f.replace(/\.md$/, '');
    titulos[`${col}/${id}`] = frontmatter(join(CONTENT, col, f)).titulo || id;
  }
}

const out = [
  '-- Seed generado por scripts/gen-seed.mjs — NO editar a mano.',
  '-- Espeja los cursos/lecciones del Markdown a las tablas courses/lessons.',
  '-- Idempotente: se puede correr varias veces (en el panel SQL o supabase db reset).',
  '',
];

const cursosDir = join(CONTENT, 'cursos');
const cursos = readdirSync(cursosDir).filter((n) => n.endsWith('.md')).sort();
for (const f of cursos) {
  const slug = f.replace(/\.md$/, '');
  const fm = frontmatter(join(cursosDir, f));
  const orden = Number.isFinite(fm.orden) ? fm.orden : 0;
  out.push(`-- Curso: ${slug}`);
  out.push(
    `insert into public.courses (slug, titulo, descripcion, orden, publicado) values ` +
      `('${sq(slug)}', '${sq(fm.titulo || slug)}', '${sq(fm.descripcion)}', ${orden}, true)`,
  );
  out.push(
    `  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;`,
  );
  const lecciones = Array.isArray(fm.lecciones) ? fm.lecciones : [];
  lecciones.forEach((l, i) => {
    const ref = `${l.col}/${l.id}`;
    if (!titulos[ref]) console.warn(`  aviso: ${slug} referencia ${ref} (no encontrado en el catálogo)`);
    out.push(
      `insert into public.lessons (course_id, ref, titulo, orden) ` +
        `select id, '${sq(ref)}', '${sq(titulos[ref] || l.id)}', ${i + 1} ` +
        `from public.courses where slug = '${sq(slug)}'`,
    );
    out.push(`  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;`);
  });
  out.push('');
}

writeFileSync(join(ROOT, 'supabase', 'seed.sql'), out.join('\n') + '\n', 'utf8');
console.log(`seed.sql escrito: ${cursos.length} cursos`);
