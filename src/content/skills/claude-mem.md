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

claude-mem es un plugin que le da memoria entre sesiones a tu agente: captura lo que hacés, lo comprime y reinyecta el contexto relevante en sesiones futuras. Así el agente "recuerda" decisiones y trabajo previo sin que tengas que repetirlo cada vez. Funciona con Claude Code y otros agentes. Le sirve a quien trabaja en proyectos largos y se cansa de recontextualizar todo cada día.

## Cómo instalarlo y usarlo, paso a paso

1. Abrí Claude Code.
2. Agregá su marketplace e instalá el plugin:

```
/plugin marketplace add thedotmack/claude-mem
/plugin install claude-mem
```

3. Una vez instalado, trabaja en segundo plano: va capturando y comprimiendo el contexto solo.
4. Cuando quieras, pedile que busque en tu memoria sobre un proyecto o tema puntual.

## Ejemplo real

Volvés a un proyecto después de unos días y no te acordás de las últimas decisiones. Le preguntás:

```
Buscá en tu memoria qué decidimos sobre la estructura de la base
de datos en este proyecto y resumime lo último que avanzamos.
```

El agente recupera el contexto comprimido y te pone al día sin que tengas que reexplicar nada.

## Trucos y errores comunes

- No esperes que recuerde todo textual: comprime el contexto, así que pedí resúmenes y revisá lo importante.
- Si arrancás un proyecto nuevo, ayudalo dándole contexto claro al principio para que la memoria arranque bien.
- Pedile búsquedas concretas ("qué decidimos sobre X") en vez de preguntas vagas.
- Mantené el plugin actualizado desde el marketplace para mejoras de captura y compresión.

## Cuándo conviene

Para quien trabaja en proyectos de varios días o semanas y quiere que el agente mantenga el hilo sin recordarle el contexto en cada sesión. Si solo hacés tareas sueltas y cortas, el beneficio es menor.
