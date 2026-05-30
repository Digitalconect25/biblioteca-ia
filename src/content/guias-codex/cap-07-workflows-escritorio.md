---
titulo: Workflows y Atajos en Escritorio
parte: Codex Desktop
n: 7
tipo: capitulo
resumen: "Setup de workspace, atajos para refactor/test/explicar/arreglar, hot corners, integración con Raycast y Alfred, multi-monitor, ejemplos reales de desarrollo."
objetivos:
  - Tener atajos para los 4 verbos más usados (refactor, test, explicar, arreglar).
  - Lanzar Codex desde launchers como Raycast / Alfred.
  - Pensar tu día en términos de tasks paralelas, no de "un cambio a la vez".
actualizado: 2026-05-30
---

Sin un setup pensado, Codex se siente como abrir ChatGPT y pegar. Con un setup pensado, se vuelve un
**pedal** que dispara tareas sin sacarte del foco. Las piezas:

## Atajos para los 4 verbos comunes

Crear 4 atajos de sistema que abren tasks con un prompt prearmado:

- `Cmd+Ctrl+R` → "Refactor: explicame qué haría falta para…"
- `Cmd+Ctrl+T` → "Tests: agregá tests al archivo seleccionado / función"
- `Cmd+Ctrl+E` → "Explicá este código (por qué, no qué)"
- `Cmd+Ctrl+F` → "Arreglá este error (pasá log/screenshot)"

En macOS los configurás con Atajos de la app. En Windows con AutoHotkey o PowerToys.

## Hot corner

Una esquina activa abre el quick action de Codex. Útil porque NO requiere cambiar de app: estás en
tu editor, llevás el mouse a la esquina superior derecha, escribís el task, enter, vuelta al editor.

## Raycast / Alfred

Raycast y Alfred tienen extensiones para Codex. Buscás "codex" en su barra, escribís el task, enter:
queda corriendo y vos seguís. Ideal porque ya tenés un launcher abierto todo el día.

## Multi-monitor: un monitor para tasks

Recomendación: dejá un monitor secundario solo con el task pane de Codex. Tus tasks corriendo siempre
a la vista, sin tapar tu editor. Cuando una termina, mirás el diff de reojo, aprobás o rechazás, seguís.

## Pensar en paralelo

El cambio mental más importante: **deja de pensar "ahora hago esto, después lo otro"**. Pensá "lanzo
estas tres tasks en paralelo y voy revisando a medida que terminan". Patrón típico:

1. 9:00 — Lanzás 3 tasks: agregar tests al módulo A, refactor del módulo B, actualizar README.
2. Vos seguís con feature nueva.
3. 9:20 — Suena la notificación: la primera task está esperando aprobación. Mirás el diff, aprobás.
4. Resto del día se llena con micro-revisiones, no con micro-tipear.

## Ejemplo real de día

Un dev senior promedio (autor de este libro incluido) tiene en un día típico:

- 8-12 tasks lanzadas a Codex (mezcla de local y Cloud).
- 60% aprobadas tal cual, 30% editadas antes de aprobar, 10% descartadas.
- Tiempo neto ahorrado: ~2-3 horas/día en código rutinario, que se invierten en pensar arquitectura
  y revisar PRs de otros.

## Anti-patrón

Lanzar una task y quedarte mirando el spinner. Lanzala, hacé otra cosa, volvé cuando suena la
notificación. Si te quedás mirando, perdiste la gracia de la delegación.

## Setup mínimo recomendado

- 3-4 atajos de sistema para los verbos comunes.
- Notificaciones del task pane activadas.
- Un monitor (o mitad de monitor) reservado para Codex.
- Raycast/Alfred con el plugin de Codex.

Con eso ya entrás en "modo agente". El resto es práctica.
