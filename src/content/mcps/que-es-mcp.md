---
titulo: ¿Qué es un MCP?
nivel: intermedio
resumen: El "enchufe estándar" que conecta agentes de IA con herramientas y datos externos.
descripcion: >
  MCP (Model Context Protocol) es un protocolo abierto que estandariza cómo un agente de
  IA se conecta con herramientas, archivos y servicios externos. En vez de integraciones a
  medida para cada cosa, un servidor MCP expone funciones que el agente puede usar (siempre
  con tu permiso). Lo soportan Claude Desktop, Claude Code y muchos otros clientes.
comoConectar: >
  En Claude Desktop: abrí Configuración → pestaña Developer → "Edit Config". Eso abre (o
  crea) el archivo claude_desktop_config.json. Agregás el servidor MCP ahí y reiniciás
  Claude Desktop por completo. La ubicación del archivo cambia según el sistema (ver
  comandos). Necesitás Node.js instalado para la mayoría de los servidores.
funciones:
  - Exponer herramientas externas al agente de forma estándar
  - Dar acceso a datos (archivos, bases de datos, APIs)
  - Reutilizar la misma integración en distintos agentes
comandos:
  - titulo: "Dónde está el archivo de configuración (Claude Desktop)"
    windows: "%APPDATA%\\Claude\\claude_desktop_config.json"
    mac: "~/Library/Application Support/Claude/claude_desktop_config.json"
    nota: "Si el archivo no existe, Claude Desktop lo crea al tocar 'Edit Config' en la pestaña Developer."
  - titulo: "Verificar que tenés Node.js"
    comun: "node --version"
    nota: "Si no lo tenés, instalalo desde nodejs.org (versión LTS recomendada)."
ejemploConfig: |
  {
    "mcpServers": {
      "mi-servidor": {
        "command": "npx",
        "args": ["-y", "@ejemplo/servidor-mcp"]
      }
    }
  }
enlaces:
  - texto: Guía oficial (conectar servidores MCP)
    url: https://modelcontextprotocol.io/quickstart/user
  - texto: Especificación de MCP
    url: https://modelcontextprotocol.io
  - texto: Servidores MCP oficiales
    url: https://github.com/modelcontextprotocol/servers
tags: [mcp, integraciones, protocolo, agentes]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

MCP es a los agentes de IA lo que USB fue a los dispositivos: un estándar para que todo se
conecte sin reinventar la integración cada vez. Tras editar la configuración, **reiniciá
Claude Desktop por completo** para que cargue el servidor.
