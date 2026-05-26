---
titulo: ¿Qué es un MCP?
nivel: intermedio
resumen: El "enchufe estándar" que conecta agentes de IA con herramientas y datos externos.
descripcion: >
  MCP (Model Context Protocol) es un protocolo abierto que estandariza cómo un agente de
  IA se conecta con herramientas, archivos y servicios externos. En vez de integraciones a
  medida para cada cosa, un servidor MCP expone funciones que el agente puede usar.
comoConectar: >
  Se agrega un "servidor MCP" a la configuración de tu agente (por ejemplo, en un archivo
  de configuración). El agente lo detecta y puede llamar a las funciones que ese servidor
  ofrece (leer una base de datos, buscar en la web, manejar archivos, etc.).
funciones:
  - Exponer herramientas externas al agente de forma estándar
  - Dar acceso a datos (archivos, bases de datos, APIs)
  - Reutilizar la misma integración en distintos agentes
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
  - texto: Especificación oficial de MCP
    url: https://modelcontextprotocol.io
tags: [mcp, integraciones, protocolo, agentes]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

MCP es a los agentes de IA lo que USB fue a los dispositivos: un estándar para que todo se
conecte sin reinventar la integración cada vez.
