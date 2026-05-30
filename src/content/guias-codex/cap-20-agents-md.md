---
titulo: AGENTS.md y Memoria del Proyecto
parte: Avanzado
n: 20
tipo: capitulo
resumen: "AGENTS.md a fondo — ubicaciones (global ~/.codex/, proyecto, subdirs), sintaxis, mejores prácticas, herencia, cómo Codex aplica las instrucciones, paridad con CLAUDE.md."
objetivos:
  - Saber dónde poner cada regla y cuándo se aplica.
  - Escribir un AGENTS.md útil sin sobrecargarlo.
  - Aprovechar la herencia entre niveles.
actualizado: 2026-05-30
---

`AGENTS.md` es **el archivo donde le contás a Codex cómo trabajar en tu proyecto**. Si lo hacés
bien, todas las tasks del proyecto arrancan ya alineadas. Si lo hacés mal o no lo hacés, le repetís
lo mismo en cada prompt.

## Las tres ubicaciones

1. **Global**: `~/.codex/AGENTS.md` — reglas que aplican a TODOS tus proyectos.
2. **Proyecto**: `<repo>/AGENTS.md` en la raíz — reglas de este proyecto.
3. **Subdirectorios**: `<repo>/src/api/AGENTS.md` — reglas específicas para ese módulo.

**Herencia**: cuando Codex trabaja en un archivo, lee TODOS los `AGENTS.md` desde la raíz hacia
abajo. Los más específicos pisan a los más generales.

## Qué incluir

- **Lenguaje y versiones**: "Este proyecto usa Node 22, TypeScript estricto, pnpm."
- **Convenciones de código**: "Imports ordenados, comillas dobles, no `any`."
- **Estilo de tests**: "Vitest, archivos `.test.ts` al lado del código, mocks mínimos."
- **Cosas que NO hacer**: "No instales nuevas dependencias sin avisar."
- **Decisiones contextuales**: "Usamos callbacks en este módulo a propósito, no convertir a
  async/await."
- **Enlaces a docs internas** (si tenés).

## Qué NO incluir

- Secrets (obvio, ya lo dijimos).
- Información que cambia seguido (mejor en un README enlazado).
- Instrucciones contradictorias entre niveles.

## Sintaxis recomendada

Markdown plano. Codex lee títulos y listas como estructura. Ejemplo:

```markdown
# Proyecto X

## Stack
- Node 22, TypeScript estricto, pnpm.
- Astro 5, Vercel adapter.

## Convenciones
- Comillas dobles en JS/TS.
- `kebab-case` para nombres de archivos.
- Variables internas en español (es un proyecto en ES), API pública en inglés.

## Tests
- Vitest con `vi.fn()`.
- Tests al lado del código (`foo.test.ts` junto a `foo.ts`).

## No hagas
- No usar `any`.
- No instalar dependencias nuevas sin preguntar.
- No reformatear archivos enteros (Prettier ya corre).
```

## Largo recomendado

Entre 200 y 500 líneas en total (sumando todos los niveles). Más que eso, cada task lee mucho
contexto solo de las reglas y pagás más tokens sin ganar precisión.

## Paridad con CLAUDE.md

Si trabajás con Claude Code en paralelo, podés tener `CLAUDE.md` y `AGENTS.md` con el mismo
contenido o casi. Algunos equipos mantienen un solo archivo (`AGENTS.md`) y symlinkean a
`CLAUDE.md`. Funciona pero ojo con CI / herramientas que lean el archivo literal.

## Tip de descubrimiento

Cuando una task falla por una convención del proyecto, NO solo arregles la task. Agregá la regla a
`AGENTS.md` para que no se repita. En 2-3 meses tu `AGENTS.md` está calibrado para tu equipo y
casi no necesitás repetir instrucciones.
