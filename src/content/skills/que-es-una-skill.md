---
titulo: ¿Qué es una "skill"?
nivel: principiante
categoria: conceptos
resumen: Una habilidad empaquetada que le enseña a un agente de IA a hacer una tarea concreta.
descripcion: >
  Una skill es un paquete de instrucciones (y a veces herramientas) que extiende lo que
  un agente de IA sabe hacer. En vez de explicarle todo cada vez, instalás una skill y el
  agente ya sabe ejecutar esa tarea: revisar código, diseñar una página, hacer QA, etc.
comoUsar: >
  Se invocan por nombre (por ejemplo, escribiendo /nombre-de-la-skill) o el agente las usa
  solo cuando detecta que aplican a lo que pediste.
comoAcceder: >
  Dependen del agente. En Claude Code, por ejemplo, las skills viven en una carpeta y se
  activan con un comando. Muchas son gratis y de código abierto.
gratis: true
enlaces:
  - texto: Documentación de Claude Code
    url: https://docs.claude.com/en/docs/claude-code
tags: [conceptos, skills, agentes]
actualizado: 2026-05-27
---

Pensá una skill como un módulo de conocimiento que le sumás a un agente de IA. En vez de explicarle desde cero cómo hacer una tarea cada vez (revisar código, diseñar una página, hacer QA), instalás una skill y el agente ya viene con las instrucciones para ejecutarla. Es lo que lo convierte de un asistente genérico en un especialista. Este concepto le sirve a cualquiera que use agentes como Claude Code y quiera entender cómo amplían lo que saben hacer.

## Cómo empezar, paso a paso

1. Entendé la idea base: una skill es un paquete de instrucciones (y a veces archivos o herramientas auxiliares) escrito en texto. El agente lo lee y sigue esas instrucciones.
2. Mirá qué skills ya trae o soporta tu agente. En Claude Code, por ejemplo, viven en una carpeta del proyecto o del sistema.
3. Identificá cómo se activan en tu agente: por nombre (escribiendo algo como `/nombre-de-la-skill`) o de forma automática cuando el agente detecta que aplican a lo que pediste.
4. Probá una skill existente antes de crear la tuya, para ver cómo cambia el comportamiento.
5. Cuando tengas una tarea repetitiva, armá una skill simple para ella.

## Ejemplo real

Una skill suele ser una carpeta con un archivo de instrucciones. La forma mínima es un texto que describe qué hace y cómo hacerlo:

```text
Nombre: revisor-de-titulos
Cuándo usar: cuando el usuario pida revisar titulos de un articulo.
Qué hacer:
1. Leé todos los titulos del documento.
2. Verificá que no superen 60 caracteres.
3. Proponé una alternativa para cada uno que se pase.
```

Con eso instalado, en vez de explicar las reglas cada vez, le decís al agente "revisá los títulos" y ya sabe los pasos y el límite de 60 caracteres.

## Trucos y errores comunes

- Una buena skill define con claridad cuándo se usa. Si la descripción es vaga, el agente no la activa en el momento correcto.
- Empezá simple: una skill de pocas líneas que resuelva una tarea concreta vale más que una enorme y confusa.
- No metas datos sensibles (claves, contraseñas) en el texto de la skill: queda guardado como instrucciones.
- Una skill no es magia: si las instrucciones tienen un error, el agente lo repetirá fielmente.

## Cuándo conviene

Conviene crear o instalar una skill cuando repetís la misma tarea muchas veces y querés resultados consistentes. Para algo que hacés una sola vez, alcanza con explicárselo al agente en el momento. Las skills brillan cuando querés estandarizar un proceso y reusarlo entre proyectos o entre miembros de un equipo.
