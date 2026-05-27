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

// Un grupo de comandos con variantes por sistema operativo.
// Cada grupo tiene un título (ej. "Instalar") y al menos una variante (windows/mac/otro).
const grupoComandos = z.object({
  titulo: z.string(),
  windows: z.string().optional(),
  mac: z.string().optional(),
  // Para comandos iguales en todos los SO (ej. npm), usar `comun` y no repetir.
  comun: z.string().optional(),
  nota: z.string().optional(),
});

// Campos comunes a skills / mcps / ias.
const baseFicha = z.object({
  titulo: z.string(),
  nivel,
  resumen: z.string().max(200, { message: "resumen: máximo 200 caracteres" }),
  descripcion: z.string(),
  gratis: z.boolean().default(true),
  ejemplo: z.string().optional(),
  // Comandos por SO (Windows / macOS), en orden. Opcional.
  comandos: z.array(grupoComandos).default([]),
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

// Trucos: consejos prácticos cortos para usar la IA mejor.
const trucos = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/trucos' }),
  schema: z.object({
    titulo: z.string(),
    nivel,
    resumen: z.string().max(200, { message: "resumen: máximo 200 caracteres" }),
    descripcion: z.string(),
    herramienta: z.string().optional(), // a qué herramienta/IA aplica (opcional)
    ejemplo: z.string().optional(),
    comandos: z.array(grupoComandos).default([]),
    enlaces: z.array(enlace).default([]),
    tags: z.array(z.string()).default([]),
    actualizado: z.coerce.date(),
    revisarAntesDe: z.coerce.date().optional(),
  }),
});

export const collections = { skills, mcps, ias, rutas, trucos };
