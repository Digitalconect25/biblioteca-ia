---
titulo: MCP de sistema de archivos
nivel: intermedio
resumen: Un servidor MCP que le da al agente acceso controlado a leer y escribir archivos.
descripcion: >
  El servidor MCP de filesystem permite que un agente lea, escriba y navegue archivos en
  carpetas que vos autorizás. Es uno de los MCPs más útiles para trabajar con proyectos
  locales de forma segura, limitando el acceso a rutas concretas.
comoConectar: >
  Se agrega a la configuración del agente indicando las carpetas permitidas. A partir de
  ahí, el agente puede operar sobre esos archivos sin tocar el resto del sistema.
funciones:
  - Leer y escribir archivos en carpetas autorizadas
  - Listar y buscar dentro de directorios
  - Limitar el acceso a rutas específicas (seguridad)
ejemploConfig: |
  {
    "mcpServers": {
      "filesystem": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-filesystem", "/ruta/permitida"]
      }
    }
  }
enlaces:
  - texto: Servidores MCP oficiales
    url: https://github.com/modelcontextprotocol/servers
tags: [mcp, archivos, local]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Útil cuando querés que el agente trabaje con tus archivos locales, pero solo dentro de las
carpetas que elegís.
