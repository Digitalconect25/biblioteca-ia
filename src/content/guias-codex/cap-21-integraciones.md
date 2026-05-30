---
titulo: Conexiones e Integraciones
parte: Avanzado
n: 21
tipo: capitulo
resumen: "GitHub, Slack notifications y slash commands, Linear y Jira, Vercel y Netlify, webhooks, OAuth, tools custom, MCP servers. Paso a paso por integración con ejemplos reales."
objetivos:
  - Conectar Codex con las herramientas que ya usás.
  - Aprovechar MCP para extender Codex a sistemas propios.
actualizado: 2026-05-30
---

Codex tiene un panel de **Conexiones** donde activás integraciones con servicios. Las útiles para
la mayoría:

## GitHub
Ya cubierta en el capítulo 13. Es la base: sin GitHub Codex pierde la mitad de su gracia.

## Slack
Dos modos:

- **Notifications**: cuando una task termina o un PR cambia, llega al canal `#codex` (o el que
  elijas).
- **Slash commands**: `/codex review #1234` o `/codex new-task ...` desde Slack mismo.

Útil para equipos que viven en Slack.

## Linear / Jira
Codex puede:

- Leer tickets del backlog.
- Crear PRs vinculados a tickets.
- Comentar en tickets cuando hay progreso.

Configurás el mapeo: "etiqueta `codex-ready` → lanzar task" o "estado 'In progress' → asignar
reviewer Codex".

## Vercel / Netlify
- Notificación cuando un PR generado por Codex falla el deploy preview.
- Logs de runtime accesibles a Codex para diagnóstico.

## Webhooks custom
Para sistemas tuyos: Codex puede llamar webhooks cuando completes una task ("avisame en mi sistema
interno") o recibir webhooks que disparan tasks.

## OAuth
La mayoría de integraciones usan OAuth de un click. Las que requieren creds más finas piden API
keys o app installations (caso GitHub Apps en orgs grandes).

## MCP servers
**Model Context Protocol** es el estándar para que Codex hable con sistemas externos. Si tu equipo
tiene una API interna, podés exponerla como MCP server y Codex la usa como herramienta nativa.

Ejemplo: MCP server de tu sistema de documentación interna → Codex puede buscar y citar tu doc
oficial cuando escribe código.

## Tools custom
Sin MCP, también podés definir tools custom en `.codex/tools/` que Codex puede llamar (scripts en
shell o Node). Útil para wrappers de comandos internos.

## Anti-patrón

Conectar todo "por las dudas". Cada integración es una superficie más de error y de costo (tokens
gastados leyendo data extra). Empezá con GitHub + Slack y agregá el resto solo si tenés un
caso real.
