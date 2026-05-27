---
titulo: Cursor
nivel: intermedio
categoria: programacion
resumen: Editor de código con IA integrada y un agente de terminal que programa por vos.
descripcion: >
  Cursor es un editor de código (basado en VS Code) con IA integrada: autocompleta, edita y
  refactoriza conversando. Además tiene un agente de terminal (Cursor CLI) que ejecuta
  tareas de código por vos, útil para automatizar o usar en scripts. Funciona en Windows,
  macOS y Linux.
comoUsar: >
  En el editor, escribís en lenguaje natural lo que querés y Cursor propone los cambios. En
  la terminal, lanzás el agente con `agent` y le das instrucciones.
comoAcceder: >
  Descargá el editor desde cursor.com (Windows, macOS y Linux). Tiene plan gratis y planes
  de pago con más uso de IA. Para el agente de terminal, instalalo con los comandos de abajo.
gratis: true
planPago: Planes de pago con más solicitudes de IA y modelos más potentes; hay capa gratuita.
comandos:
  - titulo: "Instalar el editor"
    comun: "Descargar desde https://cursor.com (instalador para Windows, macOS y Linux)"
    nota: "El editor se instala con el instalador gráfico, no por terminal."
  - titulo: "Instalar el agente de terminal (Cursor CLI)"
    windows: "irm 'https://cursor.com/install?win32=true' | iex"
    mac: "curl https://cursor.com/install -fsS | bash"
  - titulo: "Iniciar el agente"
    comun: |
      agent
      agent "refactorizá el módulo de login para usar tokens JWT"
funciones:
  - Autocompletar y editar código con IA
  - Chat sobre tu proyecto dentro del editor
  - Agente de terminal para tareas automatizadas
enlaces:
  - texto: Sitio de Cursor
    url: https://cursor.com
  - texto: Documentación del Cursor CLI
    url: https://cursor.com/docs/cli/overview
tags: [programacion, editor, agente, ide]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Si venís de VS Code, Cursor se siente igual pero con IA metida en todo. El agente de
terminal te sirve para tareas repetibles sin abrir el editor.
