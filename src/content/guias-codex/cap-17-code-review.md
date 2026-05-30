---
titulo: Flujo de Code Review
parte: Flujos de Trabajo Reales
n: 17
tipo: capitulo
resumen: "Codex como reviewer automático en PRs — setup, criterios (estilo, bugs, seguridad, perf), cuándo override, review humano + Codex en paralelo, comparación con CodeRabbit, plantillas."
objetivos:
  - Configurar a Codex como reviewer automático en PRs.
  - Definir criterios útiles (no comentarios ruido).
  - Combinar review humano + Codex sin redundancia.
actualizado: 2026-05-30
---

Codex como reviewer cambia el flujo: cada PR llega con una **primera ronda automática** que detecta
bugs obvios, problemas de estilo y posibles regresiones. Vos hacés la review humana sobre eso.

## Setup

En el repo en `chatgpt.com/codex`:

1. Settings → Reviewer → Enable.
2. Definir **criterios** (qué reviewa).
3. Definir **paths excluidos** (`vendor/`, `dist/`).
4. Definir **severidad mínima** (no comentar si es solo estilo y ya pasa el linter).

Codex se "agrega" como reviewer del PR; verás sus comentarios como cualquier otro reviewer.

## Criterios útiles

- **Bugs**: usos de variables sin inicializar, off-by-one, null/undefined posibles.
- **Seguridad**: secrets en código, SQL injection, XSS, dependencias con CVEs conocidos.
- **Perf**: queries N+1, loops anidados pesados, imports masivos.
- **Tests**: ausencia de tests para código nuevo "obvio".
- **Estilo**: solo si el linter no cubre el caso.

## Criterios que NO conviene

- Renombrar variables "porque suenan mejor": ruido.
- Re-formatear: ya lo hace Prettier/Black.
- Sugerir microoptimizaciones prematuras: distrae.

## Cuándo override

A veces Codex va a marcar algo como "problema" y vos sabés que está bien (un trabajo deliberado).
Patrones:

- Comentás "ignorar" en el thread → Codex aprende del contexto.
- O usás `// codex-ignore: next-line` (o similar, según config).
- En `AGENTS.md` agregás reglas globales ("no comentar sobre la decisión de usar callbacks en este
  módulo, es intencional").

## Review humano + Codex en paralelo

Patrón que funciona:

1. PR abre → Codex pasa primero (rápido).
2. Autor del PR resuelve lo que Codex marcó (o argumenta por qué no).
3. Solo entonces se asigna reviewer humano. El humano se enfoca en **diseño y arquitectura**,
   no en bugs obvios o estilo (eso ya pasó).

Resultado: reviews humanos más cortos y enfocados, autores que entregan PRs más limpios la
primera vez.

## Codex vs CodeRabbit

CodeRabbit es popular para review automatizado. Diferencias:

- **Codex**: integrado en tu cuenta de ChatGPT, conoce tu repo via `AGENTS.md`, puede sugerir
  cambios aplicables (no solo comentar).
- **CodeRabbit**: muy bueno detectando issues, integraciones específicas, dashboard de métricas.

Pueden coexistir. Algunos equipos usan Codex para auto-fix y CodeRabbit para métricas/reporting.

## Plantilla de review en `AGENTS.md`

```markdown
## Code review reglas

- No comentar sobre formato (Prettier ya corre).
- Severidad mínima: medium.
- Foco en: seguridad, perf, edge cases sin test.
- Si una decisión tiene un comentario `// intencional:` no la cuestiones.
- En PRs etiquetados `wip`, no hagas review.
```

## Tip

El primer mes con Codex como reviewer es ruidoso. Vas calibrando: agregás reglas a `AGENTS.md`,
desactivás categorías de comentario, ajustás severidad. Después de 2-3 semanas queda fino.
