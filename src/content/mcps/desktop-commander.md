---
titulo: Desktop Commander (MCP)
nivel: avanzado
resumen: "Servidor MCP que le da al agente control de tu escritorio: archivos, terminal y procesos."
descripcion: >
  Desktop Commander es un MCP que permite a Claude ejecutar comandos en tu terminal, manejar
  archivos y procesos, y automatizar tareas en tu computadora, con tu permiso. Es uno de los
  MCP más potentes para trabajo local, justamente por eso conviene usarlo con cuidado.
comoConectar: >
  Se agrega con el comando de Claude Code (claude mcp add). Una vez conectado, el agente puede
  proponerte ejecutar comandos y trabajar con archivos. Revisá cada acción antes de aprobar.
funciones:
  - Ejecutar comandos en la terminal
  - Leer, escribir y mover archivos
  - Manejar procesos y tareas del sistema
comandos:
  - titulo: "Agregar el MCP (Claude Code)"
    comun: "claude mcp add desktop-commander -- npx -y @wonderwhy-er/desktop-commander"
  - titulo: "Verificar que quedó conectado"
    comun: "claude mcp list"
enlaces:
  - texto: "wonderwhy-er/DesktopCommanderMCP (repo)"
    url: https://github.com/wonderwhy-er/DesktopCommanderMCP
tags: [mcp, terminal, archivos, automatizacion]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Muy poderoso: con esto el agente puede operar tu máquina. Por lo mismo, revisá cada comando
antes de aprobarlo y no lo uses en entornos sensibles sin entender qué hace.
