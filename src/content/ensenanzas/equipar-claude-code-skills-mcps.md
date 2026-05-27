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

Al terminar vas a tener tu Claude Code equipado con un pack de skills, al menos un MCP conectado y un plugin instalado, y vas a saber verificar que todo cargó. Es la diferencia entre usar Claude Code "pelado" y tener un equipo con capacidades a medida de tu trabajo.

## Qué tener en cuenta

Conviene entender qué es cada cosa, porque se confunden. Una **skill** es una instrucción reutilizable que Claude aplica cuando hace falta; un **MCP** es un servidor que le da acceso a herramientas externas (archivos, terminal, web); un **plugin** empaqueta comandos y configuraciones que se instalan desde dentro de Claude Code. No compiten: se suman.

El **scope** importa. Instalar Global deja la skill disponible en todos tus proyectos; instalar a nivel proyecto la limita a esa carpeta. Para algo que vas a usar siempre, Global; para algo específico de un cliente, mejor por proyecto. Los MCP que dan acceso a la terminal o al sistema de archivos son potentes y por eso mismo conviene revisarlos antes de aprobar acciones. Y como casi todo se baja con `npx`, necesitás Node al día y conexión.

## Si algo falla

- **`npx skills add ...` no muestra la lista.** Verificá que Node responda con `node --version`. Si la terminal quedó esperando, es la pantalla de selección: marcá con A, Enter, y elegí Claude Code y scope Global.
- **El MCP no aparece en `claude mcp list`.** Reabrí la sesión de Claude Code. Si sigue ausente, repetí el `claude mcp add` y mirá si imprime algún error de descarga.
- **El plugin no se instala.** Tiene que correrse desde dentro de Claude Code, después de lanzar `claude`, no desde la terminal del sistema.
- **`/mcp` no lista nada.** El servidor no cargó: revisá el nombre del paquete y que Node lo haya descargado sin error.
- **Instalaste de más y Claude se confunde.** Sacá lo que no uses; demasiadas skills compiten por la atención del modelo.

## Siguiente nivel

- Armá un `CLAUDE.md` que documente qué skills y MCPs usás en el proyecto, para que el equipo arranque parejo.
- Conectá un MCP propio de tu stack (tu base de datos, tu API interna) con el mismo `claude mcp add`.
- Explorá el marketplace oficial de plugins para sumar comandos de revisión, testing o despliegue.
