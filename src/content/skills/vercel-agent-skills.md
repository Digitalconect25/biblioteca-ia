---
titulo: Vercel Agent Skills
nivel: intermedio
categoria: despliegue
resumen: Skills oficiales de Vercel para desplegar y seguir buenas prácticas web con tu agente.
descripcion: >
  Pack oficial del equipo de Vercel Labs con skills para desplegar a Vercel, aplicar buenas
  prácticas de React y seguir guías de diseño web. Se enlazan (symlink) a varios agentes a la
  vez (Claude Code, Cursor, Codex y más), así se mantienen sincronizadas.
comoUsar: >
  Tras instalarlas, pedile al agente que despliegue tu app o que revise tu código React
  contra las buenas prácticas de Vercel.
comoAcceder: >
  Se instala con el CLI "skills" apuntando al repo. Elegí las skills que quieras de la lista.
gratis: true
comandos:
  - titulo: "Instalar"
    comun: "npx skills add vercel-labs/agent-skills"
    nota: "Skills útiles: deploy-to-vercel, vercel-react-best-practices, web-design-guidelines."
funciones:
  - Desplegar apps y webs a Vercel
  - Buenas prácticas para React/Next.js
  - Guías de diseño web
enlaces:
  - texto: "vercel-labs/agent-skills (repo)"
    url: https://github.com/vercel-labs/agent-skills
tags: [skills, vercel, despliegue, react]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Si desplegás en Vercel, la skill deploy-to-vercel te ahorra recordar comandos: le pedís a
tu agente que publique y se encarga.
