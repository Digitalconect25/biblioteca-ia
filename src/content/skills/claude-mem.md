---
titulo: claude-mem (memoria persistente)
nivel: intermedio
categoria: productividad
resumen: Plugin que le da memoria entre sesiones a tu agente, sin tener que recordarle el contexto.
descripcion: >
  claude-mem captura lo que hacés en cada sesión, lo comprime y reinyecta el contexto
  relevante en sesiones futuras. Así el agente "recuerda" decisiones y trabajo previo sin que
  tengas que repetirlo. Funciona con Claude Code y otros agentes.
comoUsar: >
  Una vez instalado, trabaja en segundo plano. Podés pedirle que busque en tu memoria sobre
  un proyecto o tema concreto.
comoAcceder: >
  Dentro de Claude Code, agregá su marketplace e instalá el plugin con los comandos de abajo.
gratis: true
comandos:
  - titulo: "Instalar (dentro de Claude Code)"
    comun: |
      /plugin marketplace add thedotmack/claude-mem
      /plugin install claude-mem
funciones:
  - Memoria persistente entre sesiones
  - Compresión de contexto con IA
  - Búsqueda en tu historial de trabajo
enlaces:
  - texto: "thedotmack/claude-mem (repo)"
    url: https://github.com/thedotmack/claude-mem
tags: [plugin, memoria, claude-code, contexto]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Resuelve el dolor de "empezar de cero cada sesión". Útil cuando trabajás en un proyecto
largo y querés que el agente mantenga el hilo entre días.
