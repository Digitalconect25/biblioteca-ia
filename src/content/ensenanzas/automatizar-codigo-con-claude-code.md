---
titulo: Automatizar tareas de código con Claude Code
nivel: intermedio
herramienta: Claude Code
tiempo: 20 min
resumen: Instalá Claude Code y dejá que construya o arregle tu código por vos, conversando.
descripcion: >
  Claude Code es un agente que vive en tu terminal: lee tu proyecto, edita archivos y corre
  comandos. En esta enseñanza lo instalás y le hacés completar una tarea de código real, de
  principio a fin, aprobando vos cada cambio importante.
objetivo: Que Claude implemente o arregle algo concreto en tu proyecto, con tu aprobación en cada paso.
requisitos:
  - Una cuenta de pago de Anthropic (Pro, Max, Team o Enterprise)
  - Una terminal (PowerShell en Windows, Terminal en Mac)
  - Un proyecto donde trabajar (puede ser una carpeta vacía con git)
pasos:
  - titulo: "1. Instalar Claude Code"
    detalle: "Usá el instalador nativo según tu sistema. Se actualiza solo."
    windows: "irm https://claude.ai/install.ps1 | iex"
    mac: "curl -fsSL https://claude.ai/install.sh | bash"
  - titulo: "2. Abrir tu proyecto e iniciar Claude"
    detalle: "Entrá a la carpeta del proyecto y arrancá la sesión. La primera vez te pide iniciar sesión en el navegador."
    comun: |
      cd mi-proyecto
      claude
  - titulo: "3. Pedir la tarea en lenguaje natural"
    detalle: "Describí qué querés lograr, con contexto. Claude propone los cambios antes de aplicarlos."
    comun: 'Agregá una página de contacto con un formulario (nombre, email, mensaje) y validación básica. Mostrame el plan antes de tocar archivos.'
  - titulo: "4. Revisar y aprobar los cambios"
    detalle: "Claude pide permiso para acciones sensibles (editar archivos, correr comandos). Revisá cada diff y aprobá o pedí ajustes."
  - titulo: "5. Pedir pruebas y dejarlo verificar"
    detalle: "Hacé que corra el proyecto o las pruebas para confirmar que funciona; si algo falla, pedile que lo arregle."
    comun: 'Corré el proyecto y arreglá cualquier error que aparezca. Después resumime qué cambiaste.'
enlaces:
  - texto: "anthropics/claude-code (repo oficial, 127k⭐)"
    url: https://github.com/anthropics/claude-code
  - texto: "Guía de Claude Code"
    url: https://code.claude.com/docs
  - texto: "awesome-claude-code (skills, hooks, comandos)"
    url: https://github.com/hesreallyhim/awesome-claude-code
tags: [automatizacion, claude-code, programacion, agente]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Empezá con tareas chicas y verificables. A medida que confiás en el flujo, le delegás cosas
más grandes. La clave profesional: dale contexto claro y revisá los diffs.
