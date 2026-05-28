---
titulo: MCP de Obsidian
nivel: avanzado
resumen: "Conectá Claude a tu bóveda de Obsidian con MCP: lee, busca y escribe tus notas como un segundo cerebro."
descripcion: >
  Obsidian es una app gratuita de notas en texto plano que funciona 100% local. Con un servidor
  MCP, Claude se conecta a tu bóveda y puede leer, buscar y escribir en tus notas. Así el agente
  entiende el contexto de tu negocio (clientes, proyectos, reuniones, ideas) y trabaja sobre él.
comoConectar: >
  Primero instalá Obsidian y armá tu bóveda. Después agregás un servidor MCP de Obsidian a tu
  cliente (Claude Code o Claude Desktop) apuntando a la ruta de la bóveda. Hay varios servidores
  open-source; seguí el README del que elijas para los pasos exactos (algunos usan el plugin
  community "Local REST API" + una API key).
funciones:
  - Leer y buscar en todas tus notas
  - Crear y editar notas (propuestas, emails, resúmenes)
  - Dar contexto de tu negocio al agente (clientes, proyectos, reuniones)
  - Trabajar sobre texto plano local, sin subir tus datos a un servidor
comandos:
  - titulo: "Ejemplo de servidor MCP (revisá el README del repo)"
    comun: "npx -y obsidian-mcp /ruta/a/tu/boveda"
    nota: "Es un ejemplo orientativo. Cada servidor tiene su instalación; seguí su README para el comando y la config exactos."
ejemploConfig: |
  {
    "mcpServers": {
      "obsidian": {
        "command": "npx",
        "args": ["-y", "obsidian-mcp", "/ruta/a/tu/boveda"]
      }
    }
  }
enlaces:
  - texto: "Obsidian (descarga, gratis)"
    url: https://obsidian.md
  - texto: "StevenStavrakis/obsidian-mcp (servidor MCP, 712⭐)"
    url: https://github.com/StevenStavrakis/obsidian-mcp
  - texto: "jacksteamdev/obsidian-mcp-tools (817⭐)"
    url: https://github.com/jacksteamdev/obsidian-mcp-tools
  - texto: "cyanheads/obsidian-mcp-server (vía Local REST API)"
    url: https://github.com/cyanheads/obsidian-mcp-server
tags: [mcp, obsidian, notas, productividad, segundo-cerebro]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

La idea es tener un "segundo cerebro": toda tu información ordenada en Obsidian y Claude con
acceso a ella. En vez de pegar contexto en cada chat, el agente lo lee de tu bóveda.

## Cómo conectarlo, paso a paso

1. Instalá Obsidian desde obsidian.md y creá una bóveda local.
2. Armá carpetas para tu flujo: `Clientes/`, `Proyectos/`, `Reuniones/`, `Ideas/`.
3. Elegí un servidor MCP de Obsidian (ver enlaces) y seguí su README para instalarlo.
4. En la config MCP de tu cliente, apuntá el servidor a la **ruta de tu bóveda**.
5. Reiniciá el cliente y probá una orden en lenguaje natural.

## Ejemplo real

Con la bóveda conectada, le pedís a Claude:

```
Revisá mis notas de la reunión de ayer con el cliente X en /Reuniones,
extraé los acuerdos y prepará un presupuesto. Guardalo en /Clientes/ClienteX.
```

Claude busca en tus notas, redacta el presupuesto y lo guarda donde le indicaste.

## Seguridad y errores comunes

- Dale acceso solo a la bóveda que querés; revisá qué permisos pide el servidor.
- Algunos servidores usan el plugin "Local REST API" de Obsidian + una API key: tratala como contraseña, no la compartas.
- Trabajá sobre una copia hasta confiar en el flujo; el agente puede escribir/modificar notas.
- Si Claude no "ve" la bóveda, revisá que la ruta en la config sea correcta y absoluta.

## Cuándo conviene

Para quien ya organiza su trabajo en notas y quiere que la IA opere sobre ese contexto:
freelancers, consultores y equipos chicos que manejan clientes, proyectos y reuniones.
