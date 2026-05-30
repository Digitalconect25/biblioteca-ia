---
titulo: 'Codex Web: chatgpt.com/codex'
parte: Codex Web y Cloud
n: 11
tipo: capitulo
resumen: "Dashboard de tasks, repos conectados, nueva task, selección de branch, progreso en vivo, diff viewer side-by-side, comentarios inline, pause/resume, historial."
objetivos:
  - Conocer la interfaz web a fondo.
  - Saber elegir branch base y dónde queda el resultado.
  - Usar el diff viewer para revisar cambios rápido.
actualizado: 2026-05-30
---

`chatgpt.com/codex` es la **interfaz canónica**: lo que vive en escritorio y móvil es un envoltorio
de esto. Si entendés la web, entendés la app.

## Dashboard

Te muestra:

- **Tasks recientes** (todas las superficies).
- **Repos conectados** (los que autorizaste vía GitHub).
- **Quota** del plan (tasks paralelas máximas en Cloud, tokens consumidos).
- **Atajos**: nueva task, ver Cloud, ver settings.

## Nueva task

Al lanzar una task:

1. Elegís el **repo**.
2. Elegís el **branch base** (default: el que tenga el repo como main).
3. Definís si corre en **Cloud** o en tu máquina (requiere desktop/CLI conectado).
4. Escribís el prompt (o adjuntás imagen).
5. Elegís el **modelo** y el **modo de aprobación**.
6. Lanzar.

Codex clona el repo en una sandbox (si es Cloud), lee `AGENTS.md` si existe, y arranca.

## Progreso en vivo

Ves los pasos del agente: "Reading file X", "Editing file Y", "Running tests", "Tests passed", etc.
Si una task se traba, lo notás antes de gastar más tokens.

## Diff viewer

Side-by-side por archivo. Atajos:

- `J/K` → siguiente / anterior archivo.
- `A` → aprobar archivo.
- `R` → rechazar archivo.
- `C` → comentar inline.

Aprobar todos con un botón global o archivo por archivo. Los comentarios inline van al PR final como
"discusión pendiente" o como instrucciones de iteración (depende del modo).

## Pause / resume

Si una task está corriendo y te das cuenta que el prompt está mal, podés pausarla, ajustar y reanudar
sin perder el contexto ya leído. Ahorra tokens vs cancelar y arrancar de cero.

## Historial

Cada task queda guardada con su prompt, su diff, su PR, y los costos. Útil para auditar y para
**aprender** qué prompts funcionan bien (revisás 1 mes y ves cuáles tuvieron que reiterarse).

## Diferencias clave con la app desktop

- Web puede ver tasks de Cloud pero no de local (las locales viven en tu desktop).
- Web es siempre la fuente de verdad para Cloud.

Quedate con esto: **la web es la "torre de control"**, las otras superficies son terminales que se
asoman a ella.
