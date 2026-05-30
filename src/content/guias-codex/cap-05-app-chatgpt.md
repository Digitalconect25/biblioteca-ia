---
titulo: Codex en la App de ChatGPT (macOS y Windows)
parte: Codex Desktop
n: 5
tipo: capitulo
resumen: "Task pane, hot corner, screenshot tool, multi-ventana, integración con Spotlight y drag-drop, atajos, concurrencia, resume de sesiones, sync con web y móvil."
objetivos:
  - Configurar la app de ChatGPT como tu centro de tareas Codex en escritorio.
  - Aprovechar los atajos y el hot corner para abrir tasks sin perder foco.
  - Entender cómo se sincronizan las tasks con la web y el móvil.
actualizado: 2026-05-30
---

La app de ChatGPT en desktop dejó de ser "el chat" para volverse un **centro de tareas**. El panel
lateral de Codex te muestra tasks corriendo, completadas y pendientes de aprobar, todo a la vista.

## El Task pane

Es la columna lateral donde viven tus tareas. Cada task tiene:

- **Estado** (Pending / Running / Awaiting approval / Done / Failed).
- **Surface** (Local / Cloud / IDE).
- **Diff preview** al hacer hover.

Podés tener varias corriendo en paralelo (en Cloud, sin tope práctico; en local, depende de tu máquina).

## Atajos esenciales (macOS — equivalente con Ctrl en Windows)

- `Cmd + K` → abre el quick action ("nuevo task", "buscar", "ir a…").
- `Cmd + N` → nuevo task.
- `Cmd + Shift + S` → screenshot tool (capturás zona de pantalla y se la pasás como contexto).
- `Cmd + ,` → settings.
- `Cmd + Opt + ↑/↓` → cambiar entre tasks abiertas.

## Hot corner (macOS)

Configurá una esquina activa de pantalla que abre el quick action de Codex. Útil cuando estás en
otro programa y querés disparar una task sin cambiar de app.

## Screenshot tool con contexto inteligente

`Cmd + Shift + S` → seleccionás zona → la app reconoce si es código (lee el texto via OCR), un
error en una terminal, o un mockup. Te pregunta automáticamente: "¿querés que arregle este error?",
"¿querés que implemente este diseño?". Vos confirmás y se vuelve una task.

## Drag-drop de archivos

Soltá un archivo (código, log, imagen, PDF) sobre la ventana de Codex y se adjunta a la task actual.
Útil para pasarle un stack trace largo o un design spec.

## Multi-ventana y multi-monitor

Cada task puede vivir en su propia ventana (`Cmd + Shift + N` desde una task). Útil para tener
un refactor corriendo en un monitor mientras escribís en otro.

## Spotlight / Start menu

La app expone un comando "New Codex task" que aparece en Spotlight (macOS) y en el menú Start
(Windows). Buscalo, escribí la tarea, enter, y arranca.

## Sincronización con web y móvil

Las tasks que lanzás desde el desktop con `Run in Cloud` aparecen al toque en `chatgpt.com/codex`
y en el celular. Si la task corre en local, queda atada a tu máquina (lógico: necesita acceso
a tus archivos).

## Resume de sesiones

Si cerrás la app a mitad de una task local, al volver abrir te pregunta si querés reanudar. Funciona
incluso después de reiniciar la máquina, salvo que la task estuviera corriendo `npm run dev` u otro
proceso de larga duración (esos se cortan).

## Tip de productividad

Configurá el atajo `Cmd + Shift + C` (o similar) para "Send selection as Codex task". Seleccionás
código en cualquier app, atajo, y se abre un task en ChatGPT con esa selección como contexto.
Cambia totalmente el flujo: pasás de "abrir ChatGPT y pegar" a "selección → atajo".
