---
titulo: Dividí las tareas grandes en pasos
nivel: principiante
resumen: Pedile a la IA que piense o trabaje paso a paso; en tareas complejas comete menos errores.
descripcion: >
  Para problemas con varias partes, pedir "todo de una" suele fallar. Si pedís que lo haga
  paso a paso (o que primero arme un plan y después lo ejecute), la IA razona mejor y vos
  podés corregir a mitad de camino. También te deja ver en qué paso se equivocó.
herramienta: ChatGPT / Claude / Gemini
ejemplo: |
  Antes de escribir el código, hacé un plan en pasos
  numerados de cómo lo vas a resolver. Esperá mi OK.
  Después implementá paso por paso.
tags: [prompting, razonamiento, planificacion]
actualizado: 2026-05-27
---

Cuando le pedís a la IA que resuelva todo de una, en tareas con varias partes salta directo a la conclusión y arrastra errores que ya no vas a poder ubicar. Pedir que trabaje paso a paso cambia el resultado por dos motivos: el modelo razona mejor cuando explicita cada paso, y vos podés corregir a mitad de camino en lugar de descartar todo el resultado final. Además, cuando algo sale mal, ves exactamente en qué paso se torció.

## Cómo aplicarlo

1. **Pedí primero un plan, después la ejecución.** "Antes de hacerlo, listá los pasos. Esperá mi OK." Así revisás el enfoque antes de gastar tiempo.
2. **Numerá los pasos.** Una lista numerada te deja señalar "el paso 3 está mal" sin rehacer el resto.
3. **Frená en los puntos críticos.** Para decisiones importantes, pedí que pare y te consulte antes de seguir.
4. **Para razonar, pedí que piense en voz alta.** "Mostrá tu razonamiento antes de darme la respuesta final" reduce errores de lógica.

## Antes y después

Todo de una:

```
Armame el plan completo de lanzamiento de mi curso online,
con precios, fechas y textos de los mails.
```

Por pasos:

```
Vamos a armar el lanzamiento de mi curso por partes.
Paso 1: listá las etapas del lanzamiento (sin desarrollarlas).
Esperá mi OK antes de seguir.
Cuando lo apruebe, desarrollamos una etapa por vez.
```

## Llevalo más lejos

- **Checkpoints de aprobación.** En tareas largas pedile que al final de cada paso resuma qué hizo y qué sigue, y que espere tu confirmación.
- **Que se autocorrija.** Cerrá con "revisá tu propio razonamiento y marcá si algo no cierra antes de darme la respuesta".
- **Dividir y delegar.** Para algo grande, usá un paso para generar el plan y conversaciones separadas para ejecutar cada parte sin que se mezcle el contexto.
