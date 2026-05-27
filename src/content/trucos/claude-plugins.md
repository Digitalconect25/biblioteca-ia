---
titulo: Claude — instalar y usar plugins
nivel: avanzado
resumen: 'Los plugins empaquetan skills, comandos, agentes, hooks y MCPs. Se agregan desde un "marketplace" con /plugin.'
descripcion: >
  Un plugin de Claude Code es un paquete que puede incluir varias cosas a la vez: comandos
  (slash commands), subagentes, servidores MCP, hooks y skills. Sirve para instalar de una sola
  vez un conjunto de capacidades y compartirlo con tu equipo. Primero registrás un "marketplace"
  (normalmente un repositorio de GitHub) y después instalás los plugins que quieras desde ahí.
  Los comandos se escriben dentro de Claude Code. Como un plugin puede traer MCPs y hooks que
  ejecutan acciones, instalá solo plugins de fuentes en las que confíes.
herramienta: Claude Code
ejemplo: |
  Pasos típicos dentro de Claude Code:

  1) /plugin marketplace add usuario/repo
  2) /plugin install nombre-del-plugin@nombre-del-marketplace
  3) /plugin   (para ver y administrar lo instalado)
comandos:
  - titulo: "Agregar un marketplace de plugins"
    comun: "/plugin marketplace add usuario/repo"
    nota: "Se escribe dentro de Claude Code. El origen suele ser un repositorio de GitHub."
  - titulo: "Instalar un plugin desde ese marketplace"
    comun: "/plugin install nombre@marketplace"
  - titulo: "Ver y administrar plugins instalados"
    comun: "/plugin"
enlaces:
  - texto: Documentación de Plugins (Claude Code)
    url: https://code.claude.com/docs/en/plugins
  - texto: Descubrir plugins
    url: https://code.claude.com/docs/en/discover-plugins
tags: [claude, claude-code, plugins, mcp, skills, avanzado]
actualizado: 2026-05-27
revisarAntesDe: 2026-08-27
---

Pensá un plugin como una "caja" que junta skills, comandos, agentes, hooks y MCPs listos para
usar. Instalá solo desde fuentes confiables: pueden ejecutar acciones en tu equipo.
