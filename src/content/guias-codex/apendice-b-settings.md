---
titulo: Settings y configuración por superficie
parte: Apéndices
n: B
tipo: apendice
resumen: "Opciones de configuración por superficie (app, IDE, CLI, Cloud), valores por defecto y recomendaciones."
actualizado: 2026-05-30
---

## App de ChatGPT (desktop)

- **Default model**: balanceado.
- **Default run-in**: local.
- **Approval mode**: ask.
- **Notifications**: awaiting_approval ON, completed ON, failed ON.
- **Hot corner**: off (activalo).
- **Auto-resume tasks**: ON (recuperar al abrir).

## App móvil

- **Push: awaiting_approval**: ON (lo importante).
- **Push: progress updates**: OFF (mucho ruido).
- **Voice input**: ON.
- **Auto-download diffs**: ON (revisar offline).

## Extensión IDE

- **Inline suggestions**: ON solo si no usás Copilot ni Cursor AI inline.
- **Chat panel keybinding**: `Cmd/Ctrl+Shift+L`.
- **Default model for chat**: balanceado.

## CLI

Archivo: `~/.codex/config.toml`

```toml
[default]
model = "codex-balanced"
approval_mode = "ask"
run_in = "local"

[output]
color = true
json = false
```

## Cloud (por proyecto)

Configurado en `.codex/settings.json`:

```json
{
  "defaultModel": "codex-balanced",
  "runIn": "cloud",
  "branchPattern": "codex/task-{id}",
  "autoOpenPR": true,
  "labels": ["codex", "auto"],
  "ignore": ["dist/**", "node_modules/**", "vendor/**"],
  "network": "allowlist",
  "allowedHosts": ["registry.npmjs.org", "api.github.com"]
}
```

## Recomendaciones generales

- Mantené **un solo asistente inline** activo (Codex o Copilot, no los dos).
- En repos sensibles, **approval mode = manual** o `ask`.
- Logs y archivos grandes: agregar a `.codexignore` para no gastarlos como contexto.
