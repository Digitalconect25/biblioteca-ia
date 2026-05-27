---
titulo: Superpowers (plugin)
nivel: intermedio
categoria: productividad
resumen: Plugin para Claude Code con 20+ skills de TDD, debugging, brainstorming y revisión.
descripcion: >
  Superpowers es un plugin muy popular para Claude Code (de Jesse Vincent) que suma más de
  20 skills probadas y se autoactivan según el contexto: brainstorming antes de codear, TDD
  estricto, debugging sistemático y revisión de código exhaustiva. Trae comandos como
  /brainstorm, /write-plan y /execute-plan.
comoUsar: >
  Se instala como plugin desde el marketplace oficial. Las skills se activan solas cuando
  hacen falta; también podés invocar sus comandos directamente.
comoAcceder: >
  Dentro de Claude Code, instalalo desde el marketplace oficial con el comando de abajo.
gratis: true
comandos:
  - titulo: "Instalar (dentro de Claude Code)"
    comun: "/plugin install superpowers@claude-plugins-official"
funciones:
  - Brainstorming antes de escribir código
  - Test-driven development (TDD) estricto
  - Debugging sistemático
  - Revisión de código exhaustiva
enlaces:
  - texto: "obra/superpowers (repo)"
    url: https://github.com/obra/superpowers
tags: [plugin, claude-code, productividad, tdd]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Superpowers es un plugin muy popular para Claude Code (de Jesse Vincent) que suma más de 20 skills probadas que se autoactivan según el contexto: brainstorming antes de codear, TDD estricto, debugging sistemático y revisión de código exhaustiva. Trae comandos como `/brainstorm`, `/write-plan` y `/execute-plan`. Le sirve a quien quiere que su agente trabaje con método (planear, testear, revisar) en vez de improvisar.

## Cómo instalarlo y usarlo, paso a paso

1. Abrí Claude Code.
2. Instalalo desde el marketplace oficial:

```
/plugin install superpowers@claude-plugins-official
```

3. Listo: las skills se activan solas cuando hacen falta. No tenés que invocarlas a mano.
4. Para arrancar una tarea nueva con método, usá el comando de brainstorming antes de escribir código.

## Ejemplo real

Vas a sumar una feature y querés pensarla antes de codear. Corrés:

```
/brainstorm
```

Después de definir el enfoque, seguís con `/write-plan` para armar el plan y `/execute-plan` para ejecutarlo paso a paso, con TDD y revisión incluidos.

## Trucos y errores comunes

- Dejá que las skills se autoactiven: forzar comandos en cada paso te quita el beneficio del flujo automático.
- Arrancá por el brainstorming en tareas nuevas; saltearlo lleva a planes flojos.
- Si seguís TDD estricto, no apures la parte de tests: es la base del flujo.
- Mantené el plugin actualizado desde el marketplace para traer las skills nuevas.

## Cuándo conviene

Para quien programa con Claude Code y quiere un proceso ordenado de extremo a extremo: pensar, planear, testear y revisar. Útil sobre todo en proyectos donde improvisar sale caro.
