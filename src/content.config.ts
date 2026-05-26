import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// El `id` de cada entrada viene del nombre de archivo (filename = slug).
// No incluimos `slug` en el frontmatter: una sola fuente de verdad.

const NIVELES = ['principiante', 'intermedio', 'avanzado'] as const;

// Mensajes de error en español para que un contribuyente no-técnico entienda.
const nivel = z.enum(NIVELES, {
  message: "nivel debe ser: principiante, intermedio o avanzado",
});

const enlace = z.object({
  texto: z.string(),
  url: z.string().url({ message: "url inválida (debe empezar con http...)" }),
});

// Campos comunes a skills / mcps / ias.
const baseFicha = z.object({
  titulo: z.string(),
  nivel,
  resumen: z.string().max(200, { message: "resumen: máximo 200 caracteres" }),
  descripcion: z.string(),
  gratis: z.boolean().default(true),
  ejemplo: z.string().optional(),
  enlaces: z.array(enlace).default([]),
  tags: z.array(z.string()).default([]),
  actualizado: z.coerce.date(),
  // Pasada esta fecha, la ficha se marca visualmente como "puede estar desactualizada".
  revisarAntesDe: z.coerce.date().optional(),
});

const skills = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/skills' }),
  schema: baseFicha.extend({
    categoria: z.string().optional(),
    comoUsar: z.string(),
    comoAcceder: z.string(),
  }),
});

const mcps = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/mcps' }),
  schema: baseFicha.extend({
    funciones: z.array(z.string()).default([]),
    comoConectar: z.string(),
    ejemploConfig: z.string().optional(),
  }),
});

const ias = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/ias' }),
  schema: baseFicha.extend({
    funciones: z.array(z.string()).default([]),
    comoAcceder: z.string(),
    planPago: z.string().optional(),
    casosDeUso: z.array(z.string()).default([]),
  }),
});

// Rutas por meta: secuencia ordenada de ítems del catálogo (decisión híbrida).
const rutas = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/rutas' }),
  schema: z.object({
    titulo: z.string(),
    meta: z.string(),
    nivel,
    resumen: z.string(),
    actualizado: z.coerce.date(),
    pasos: z
      .array(
        z.object({
          tipo: z.enum(['skill', 'mcp', 'ia']),
          ref: z.string(), // id (filename) del ítem en su colección
          porque: z.string(),
        })
      )
      .min(1, { message: "una ruta necesita al menos un paso" }),
  }),
});

export const collections = { skills, mcps, ias, rutas };
