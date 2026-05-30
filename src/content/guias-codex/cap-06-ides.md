---
titulo: Codex en VS Code, Cursor y JetBrains
parte: Codex Desktop
n: 6
tipo: capitulo
resumen: "Extensiones de IDE: instalación, auth, panel, sugerencias inline vs chat, diffs multi-archivo, atajos, coexistencia con Cursor AI y Copilot, configuración por IDE."
objetivos:
  - Tener Codex funcionando dentro de tu IDE favorito.
  - Entender la diferencia entre inline (autocompletar) y chat (delegar).
  - Convivir con Cursor AI o Copilot sin pelearte con sugerencias dobles.
actualizado: 2026-05-30
---

La extensión de IDE es para los que vivimos en el editor. Codex aparece de dos formas:

1. **Inline**: sugerencias ghost-text mientras tipeás (al estilo Copilot).
2. **Chat / Tasks**: panel lateral donde delegás tareas más grandes que un autocomplete.

## Instalación

- **VS Code / Cursor**: marketplace → "OpenAI Codex" (publisher: OpenAI). Recargar ventana.
- **JetBrains**: Settings → Plugins → marketplace → "OpenAI Codex".
- En las dos: `Cmd/Ctrl+Shift+P` → "Codex: Sign in" → autorizar en navegador.

## Inline vs chat: cuándo cada uno

- **Inline** para autocompletar una función chica, un test obvio, JSDoc, regex.
- **Chat** cuando la tarea necesita leer más de un archivo o pensar en pasos: refactors, bugs no
  triviales, agregar features.

Regla práctica: si lo que querés hacer cabe en 1 línea de descripción y 1 archivo de cambio,
inline. Si no, chat.

## Diffs multi-archivo

El panel de Codex te muestra un **diff agrupado** cuando una task toca varios archivos. Aprobás de
golpe o archivo por archivo. Útil para refactors que tocan muchos lugares: ves el cambio antes de
aplicar.

## Atajos por IDE

- VS Code/Cursor: `Cmd/Ctrl+Shift+L` abre el chat lateral. `Tab` acepta inline, `Esc` rechaza.
- JetBrains: el shortcut por defecto es `Alt+/` o se configura en Keymap.

## Coexistencia con Cursor AI y Copilot

Es el dolor de cabeza más común: dos extensiones compitiendo por el mismo `Tab` para autocompletar.
Soluciones:

- En **Cursor**: las settings de Cursor permiten elegir el "AI provider"; podés desactivar el
  autocomplete de Cursor AI y dejar solo el de Codex (o al revés).
- En **VS Code con Copilot**: en settings → "Editor: Inline Suggest: Enabled" controlás cuál tiene
  prioridad. Recomendación: usar uno solo para inline, y el otro solo para chat. Convivir bien =
  no superponer features.

## Configuración por proyecto

Si tu proyecto tiene un `AGENTS.md` en la raíz, la extensión lo lee y aplica sus reglas. También
podés tener `.codex/settings.json` para preferencias específicas del proyecto (modelo, modo de
aprobación, archivos a ignorar).

## Anti-patrón

Tener **tres** asistentes inline activos al mismo tiempo: Copilot + Cursor AI + Codex. Cada uno
intenta autocompletar, las sugerencias parpadean, terminás aceptando cualquier cosa. Elegí uno
y desactivá los otros para inline.

## Resumen

La extensión hace que Codex se sienta "parte del editor" en vez de algo externo. Lo más rentable
es usar inline para lo chico y delegar al chat lo que requiere pensar.
