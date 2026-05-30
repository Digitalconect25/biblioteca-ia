---
titulo: Qué es Codex
parte: Mundo Codex
n: 1
tipo: capitulo
resumen: "El agente de coding de OpenAI (no el modelo de 2021): las 6 superficies, por qué se le dice agente y no asistente, diferencias con los asistentes tradicionales."
objetivos:
  - Distinguir el Codex actual del modelo "Codex" de 2021.
  - Conocer las 6 superficies donde vive (desktop, móvil, web, Cloud, IDE, CLI).
  - Entender la diferencia entre "asistente que sugiere" y "agente que ejecuta".
actualizado: 2026-05-30
---

Cuando hoy escuchás "Codex" no se está hablando del modelo viejo de 2021 (aquel que entrenó GitHub Copilot
en su primera versión). El Codex actual es **el agente de coding de OpenAI**: un sistema que recibe una
tarea en lenguaje natural y la lleva a cabo dentro de tu código — escribe archivos, ejecuta comandos,
corre tests y, si lo aprobás, abre un Pull Request — sin que tengas que copiarle código en cada paso.

## Asistente vs agente: la diferencia importa

Un asistente tradicional (Copilot clásico, ChatGPT con código pegado, Tabnine) **sugiere**. Vos escribís,
él autocompleta o propone, vos copiás. La iniciativa la llevás vos.

Un agente como Codex **ejecuta**. Le decís "agregá Stripe Checkout a la página de planes y dejá un test
que cubra el flujo de éxito". Él:

1. Lee tu repo para entender la estructura.
2. Plantea un plan (qué archivos toca).
3. Te pide aprobación (según el modo configurado).
4. Edita los archivos.
5. Corre el lint y los tests.
6. Te muestra el diff o directamente abre el PR.

Ese cambio de iniciativa es lo que justifica la palabra **agente**. No es solo un mejor autocompletado.

## Las 6 superficies

Codex vive en seis lugares y todos comparten la misma cuenta, las mismas tareas y los mismos archivos
recientes:

1. **Desktop** — la app de ChatGPT para macOS y Windows trae un panel de tasks integrado.
2. **Móvil** — apps de iOS y Android para lanzar tareas, ver progreso y aprobar PRs en cualquier lado.
3. **Web** — `chatgpt.com/codex` con dashboard, repos conectados y diff viewer en el navegador.
4. **Codex Cloud** — entornos sandbox en la nube de OpenAI para tareas largas (refactors de mil archivos,
   migraciones). Lo lanzás, te vas a dormir, te despertás con el PR listo para revisar.
5. **IDE** — extensiones para VS Code, Cursor y JetBrains: sugerencias inline, chat lateral, diff
   multi-archivo dentro de tu editor.
6. **CLI** — el comando `codex` para terminal. Pipeable, scripteable, ideal para CI o servidores.

Todas las superficies leen los mismos archivos de configuración (`AGENTS.md`, settings) y se sincronizan
en tiempo casi real.

## Lo que no es Codex

- **No es el modelo de 2021** (ese fue retirado).
- **No es Copilot.** Copilot vive dentro del editor y se enfoca en autocompletar línea por línea. Codex
  está pensado para tareas más grandes que requieren leer varios archivos antes de tocar uno.
- **No es solo ChatGPT con código.** ChatGPT puede explicar código, pero no ejecuta nada en tu repo
  ni abre PRs. Codex sí.

## Cuándo conviene Codex

- Tareas que tocan **más de un archivo**.
- Cosas con un **test claro** ("acepta este input, devolvé este output").
- **Refactors mecánicos** ("convertí estas 80 clases a hooks").
- **Setup repetitivo** ("agregale a este repo: ESLint, Prettier, GitHub Actions, README").
- **Triage de bugs** con un repro claro.

## Cuándo NO conviene (todavía)

- Decisiones de **arquitectura** sin contexto previo: pedile primero un plan, no que ejecute.
- Cosas con **estado vivo** difícil de simular (race conditions, memory leaks bajo carga).
- Diseño visual fino: ahí Cursor/Figma siguen siendo mejores.
- Cualquier cosa que toque producción **sin sandbox**.

## La idea base: tarea → plan → ejecución → revisión

Si te quedás con una sola cosa de este capítulo, que sea esta: Codex no es "magia que escribe código".
Es un ciclo de **tarea → plan → ejecución → revisión**, donde tu papel cambia de "tipear todo" a
"escribir tareas claras y revisar diffs". El resto del libro te enseña a hacer ese ciclo rápido,
seguro y barato en costo de tokens.
