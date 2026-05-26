---
# Plantilla de MCP. Copiá a src/content/mcps/ y renombrá (ej: mi-mcp.md). El nombre = slug.
titulo: Nombre del MCP
nivel: intermedio              # principiante | intermedio | avanzado
resumen: Una frase (máx 200 caracteres) de qué hace este servidor MCP.
descripcion: >
  Qué es y para qué sirve (lo estable).
comoConectar: >
  Cómo se agrega a la configuración del agente.
funciones:
  - Función 1
  - Función 2
ejemploConfig: |              # opcional
  {
    "mcpServers": {
      "nombre": { "command": "npx", "args": ["-y", "paquete"] }
    }
  }
gratis: true
enlaces:
  - texto: Repositorio
    url: https://ejemplo.com
tags: [mcp]
actualizado: 2026-01-01
revisarAntesDe: 2026-06-01
---
