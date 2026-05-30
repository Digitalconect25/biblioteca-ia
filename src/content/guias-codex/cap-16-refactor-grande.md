---
titulo: Flujo de Refactoring Grande
parte: Flujos de Trabajo Reales
n: 16
tipo: capitulo
resumen: "Refactors a escala — planeación con Codex, delegación a Cloud para no bloquear la laptop, revisión incremental de diffs, ejemplos (Express→Fastify, class→Hooks), cómo evitar refactors descontrolados."
objetivos:
  - Planificar un refactor grande antes de tocar nada.
  - Delegar a Cloud y revisar incremental.
  - Evitar el efecto "refactor que no termina nunca".
actualizado: 2026-05-30
---

Refactors grandes (migrar de una librería a otra, convertir clases a hooks, mover lógica a un módulo)
son la **killer feature** de Codex Cloud. Pero también el escenario donde más fácil se desmadra todo
si no planificás.

## El bucle que funciona

1. **Plan primero**: pedile a Codex que **liste** los archivos afectados y proponga un plan
   por fases. NO le pidas "refactoreá X" directo.
2. **Aprobá el plan**: revisás, recortás (no todo es necesario), ordenás.
3. **Ejecutá por fases**: una task por fase, no todo en una.
4. **PR por fase**: cada fase es un PR independiente. Revisable, revertible.

## Ejemplo: Express → Fastify

Tu API tiene 80 endpoints en Express, querés pasar a Fastify por performance.

**Fase 1 — plan**:
> "Listá todos los endpoints de Express en este repo. Agrupalos por router. Identificá los que usan
> middlewares específicos de Express (no portables). Proponé un orden de migración (primero los más
> simples)."

**Fase 2 — preparación**:
> "Agregá Fastify como dependencia. Creá `src/server.fastify.ts` con la estructura base. NO toques
> los routers todavía."

**Fase 3+ — migración por router** (una task por router):
> "Migrá el router `routes/users.ts` de Express a Fastify. Mantené todos los endpoints con la misma
> firma. Actualizá los tests. Asegurate que pasan."

Cada fase = un PR. Si una sale mal, revertís solo esa.

## Class components → Hooks

Mismo patrón: plan + lista + fases. Tip extra:

- Empezá por componentes **sin estado interno complicado** (los más fáciles ganan momentum).
- Dejá para el final los componentes con `componentDidMount` con efectos múltiples.

## Anti-patrón: "refactor todo lo viejo de este repo"

Es el prompt que rompe todo. Sin acotar, Codex puede:

- Cambiar nombres de variables "porque sonaban mejor".
- Romper APIs públicas sin avisar.
- Crear un PR de 200 archivos imposible de revisar.

Acotá siempre:

- Qué archivos / módulos.
- Qué cambia (la regla del refactor: comportamiento igual, código distinto).
- Qué NO cambia (firmas públicas, archivos `.d.ts`, comentarios de licencia).

## Revisión incremental

Un PR de 50 archivos NO se revisa "leyendo cada archivo". Patrón:

1. Lee el resumen del PR primero.
2. Mirá los **tests** modificados: ¿cubren bien?
3. Mirá 3-5 archivos al azar para verificar consistencia.
4. Confiá en que `git diff` te muestra solo lo que cambió.
5. Corré los tests localmente al menos una vez.

## Tip de presupuesto

Refactors largos consumen muchísimos tokens. Antes de delegar uno, mirá el contador estimado en
el dashboard. Si dice "esta task podría consumir 500k tokens", ajustá el alcance.

## Mantra

> Un refactor grande no es **una** task. Son **diez** tasks en serie. Planificá primero, ejecutá
> por fases, mergea por partes.
