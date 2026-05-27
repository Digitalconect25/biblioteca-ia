---
titulo: Equipá tu Claude Code con skills, MCPs y plugins
nivel: intermedio
herramienta: Claude Code
tiempo: 15 min
resumen: Instalá packs de skills, conectá MCPs y sumá plugins para volver a Claude Code un equipo completo.
descripcion: >
  Claude Code "de fábrica" ya es potente, pero con packs de skills, servidores MCP y plugins
  se vuelve un equipo entero. En esta enseñanza instalás un pack de skills, conectás un MCP y
  sumás un plugin, todo con comandos que funcionan igual en Windows y Mac.
objetivo: Dejar tu Claude Code equipado con skills, al menos un MCP y un plugin, y saber verificarlo.
requisitos:
  - Claude Code instalado (ver la enseñanza de Claude Code)
  - Node.js instalado (nodejs.org, versión LTS)
  - En Windows, usás PowerShell; en Mac, la Terminal (los comandos son los mismos)
pasos:
  - titulo: "1. Verificar que tenés lo básico"
    detalle: "Confirmá que Claude Code y Node responden."
    comun: |
      claude --version
      node --version
  - titulo: "2. Instalar un pack de skills"
    detalle: "El CLI 'skills' baja un pack desde un repo. Cuando aparece la lista, marcá con A, Enter, elegí Claude Code y scope Global."
    comun: "npx skills add coreyhaines31/marketingskills"
  - titulo: "3. (Opcional) Sumar un mega-pack"
    detalle: "Antigravity trae cientos de skills. Te deja elegir categorías para no instalar todo."
    comun: "npx antigravity-awesome-skills --claude"
  - titulo: "4. Conectar un MCP (herramientas externas)"
    detalle: "Un MCP le da acceso a algo (archivos, terminal, web). Ejemplo: Desktop Commander."
    comun: "claude mcp add desktop-commander -- npx -y @wonderwhy-er/desktop-commander"
  - titulo: "5. Instalar un plugin (dentro de Claude Code)"
    detalle: "Lanzá `claude` y, ya dentro, instalá un plugin del marketplace oficial."
    comun: |
      claude
      /plugin install superpowers@claude-plugins-official
  - titulo: "6. Verificar todo"
    detalle: "Confirmá MCPs y comandos disponibles."
    comun: |
      claude mcp list
      # dentro de Claude Code:
      /help
      /mcp
enlaces:
  - texto: "Marketplace oficial de plugins (anthropics)"
    url: https://github.com/anthropics/claude-plugins-official
  - texto: "Marketing Skills (ejemplo de pack)"
    url: https://github.com/coreyhaines31/marketingskills
  - texto: "Desktop Commander MCP (ejemplo de MCP)"
    url: https://github.com/wonderwhy-er/DesktopCommanderMCP
tags: [automatizacion, claude-code, skills, mcp, plugins]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Regla profesional: instalá solo lo que vas a usar. Es fácil llenar la carpeta de skills con
cientos de cosas; un set chico y conocido rinde más que un cofre que no recordás.
