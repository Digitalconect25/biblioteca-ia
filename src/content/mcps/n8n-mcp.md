---
titulo: n8n MCP
nivel: avanzado
resumen: Servidor MCP para crear y manejar automatizaciones de n8n desde tu agente de IA.
descripcion: >
  n8n es una herramienta de automatización de flujos de trabajo (como Zapier o Make, pero de
  código abierto). Este MCP conecta a Claude con n8n para diseñar, configurar y validar
  workflows conversando, en vez de armar cada nodo a mano.
comoConectar: >
  Se agrega con el comando de Claude Code. Una vez conectado, podés pedirle a Claude que arme
  o ajuste automatizaciones de n8n.
funciones:
  - Crear y editar workflows de n8n
  - Configurar y validar nodos
  - Ayuda con expresiones y patrones de automatización
comandos:
  - titulo: "Agregar el MCP (Claude Code)"
    comun: "claude mcp add --transport stdio n8n-mcp -- npx n8n-mcp@latest"
enlaces:
  - texto: "czlonkowski/n8n-mcp (repo)"
    url: https://github.com/czlonkowski/n8n-mcp
  - texto: "n8n (sitio)"
    url: https://n8n.io
tags: [mcp, automatizacion, n8n, workflows]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Si automatizás con n8n, este MCP convierte "armar un workflow" en una conversación. Bueno
para conectar apps y mover datos sin programar cada paso.
