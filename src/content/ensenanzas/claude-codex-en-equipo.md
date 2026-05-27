---
titulo: Usá Claude y Codex en equipo
nivel: avanzado
herramienta: Claude Code + Codex
tiempo: 20 min
resumen: Hacé que Claude Code y Codex de OpenAI trabajen juntos en la misma carpeta y se complementen.
descripcion: >
  Claude Code (Anthropic) y Codex (OpenAI) no compiten: usados juntos en el mismo proyecto
  rinden más. Una idea común es que Claude planee y construya, y Codex audite o "rescate"
  cuando Claude se traba. Hay dos caminos para conectarlos, y un plugin oficial que agrega
  comandos de revisión cruzada.
objetivo: Tener Claude y Codex coordinados en un proyecto, con revisión cruzada de código.
requisitos:
  - Claude Code instalado y con cuenta de pago
  - Codex (cuenta de OpenAI / ChatGPT)
  - Node.js instalado
pasos:
  - titulo: "1. Instalar el Codex CLI"
    detalle: "Instalá la CLI de Codex. También podés usar la terminal embebida de la app de ChatGPT."
    comun: "npm install -g @openai/codex"
  - titulo: "2. Camino A — desde Codex"
    detalle: "En la app de ChatGPT, abrí la terminal embebida (Cmd+J en Mac) y corré Claude ahí, así viven en la misma carpeta."
    comun: "claude"
  - titulo: "3. Camino B — plugin oficial en Claude Code"
    detalle: "Instalá el plugin openai/codex-plugin-cc (ver el repo para los pasos exactos). Desbloquea comandos como /codex:review, /codex:adversarial-review y /codex:rescue."
  - titulo: "4. Usarlos en equipo"
    detalle: "Patrón típico: Claude planea y construye; antes de commitear, pedís a Codex que audite. Si Claude se atora, usás el rescate de Codex."
    comun: '/codex:review'
enlaces:
  - texto: "openai/codex-plugin-cc (plugin, 20k⭐)"
    url: https://github.com/openai/codex-plugin-cc
  - texto: "openai/codex (Codex CLI)"
    url: https://github.com/openai/codex
  - texto: "Guía en español (tododeia)"
    url: https://www.tododeia.com/community/claude-codex-equipo
tags: [automatizacion, claude-code, codex, revision]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Cuidado con el "Review Gate" (un hook que audita cada respuesta de Claude con Codex): es
potente pero, mal usado, puede vaciar tu cuota en horas. Activalo solo cuando lo necesites.
