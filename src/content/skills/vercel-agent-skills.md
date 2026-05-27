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

Pack oficial de Vercel Labs con skills para desplegar a Vercel, aplicar buenas prácticas de React/Next.js y seguir guías de diseño web. Se enlazan (symlink) a varios agentes a la vez (Claude Code, Cursor, Codex y más), así se mantienen sincronizadas en todos. Le sirve a quien desarrolla en el ecosistema Vercel y quiere que su agente publique y revise el código con criterios del equipo de Vercel.

## Cómo instalarlo y usarlo, paso a paso

1. Verificá que tengas Node para usar `npx`.
2. Instalalo apuntando al repo:

```
npx skills add vercel-labs/agent-skills
```

3. En la lista, elegí las skills que quieras. Las útiles son `deploy-to-vercel`, `vercel-react-best-practices` y `web-design-guidelines`.
4. Después pedile al agente que despliegue tu app o que revise tu código React contra las buenas prácticas de Vercel.

## Ejemplo real

Terminaste una feature y querés publicarla. En vez de recordar comandos, le pedís al agente:

```
Desplegá esta app a Vercel y avisame la URL del deploy.
```

La skill `deploy-to-vercel` se encarga del proceso y te devuelve el resultado.

## Trucos y errores comunes

- No instales todas las skills si solo vas a desplegar: elegí las que de verdad vas a usar.
- Para que el deploy funcione, asegurate de tener tu cuenta de Vercel configurada en el entorno.
- Usá `vercel-react-best-practices` como revisión antes de publicar, no después de un bug.
- Como se sincroniza por symlink, una actualización te sirve para todos los agentes a la vez.

## Cuándo conviene

Para developers que trabajan con React/Next.js y despliegan en Vercel, y quieren que su agente maneje el deploy y las buenas prácticas sin salir del flujo de trabajo.
