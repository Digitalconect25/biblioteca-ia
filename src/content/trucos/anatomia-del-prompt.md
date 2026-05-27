---
titulo: La anatomía de un buen prompt
nivel: principiante
resumen: "Un prompt sólido tiene partes: rol, objetivo, contexto, tarea, formato y restricciones. Si las tenés a mano, dejás de improvisar."
descripcion: >
  La mayoría de los prompts fallan porque les falta alguna pieza. Si pensás el pedido como
  un armado de partes (rol, objetivo, contexto, tarea, formato y restricciones) podés revisar
  qué le falta antes de mandarlo. No hace falta usar todas siempre, pero conocerlas te da una
  checklist mental para que la IA no tenga que adivinar.
herramienta: Todas las IAs
ejemplo: |
  Rol: Actuá como editor de textos exigente.
  Contexto: Es un mail para un cliente que se quejó por una demora.
  Tarea: Reescribí el borrador de abajo para que suene profesional y empático.
  Formato: Devolveme solo el mail corregido, sin explicaciones.
  Restricciones: Máximo 120 palabras, tono cordial, en español rioplatense.

  Borrador: ...
tags: [prompting, basico, estructura]
actualizado: 2026-05-28
---

Cuando un prompt sale mal, casi nunca es por la IA: es porque faltó una pieza. Pediste el qué pero no el para quién, o el tema pero no el formato, y la IA rellenó el hueco a su criterio. Pensar el prompt como un conjunto de partes te da una checklist: antes de mandar, mirás si están las que importan. Así dejás de improvisar y de reescribir el mismo pedido tres veces.

## Cómo aplicarlo

1. **Rol.** Quién querés que sea la IA: "actuá como nutricionista", "como editor exigente". Activa el vocabulario y el criterio adecuados.
2. **Objetivo y tarea.** Qué querés lograr y qué acción concreta tiene que hacer: explicar, resumir, corregir, decidir.
3. **Contexto.** La situación real: para quién es, qué pasó antes, qué material hay que usar.
4. **Formato.** Cómo querés la salida: lista, tabla, mail, JSON, una sola frase.
5. **Restricciones.** Los límites: largo, tono, idioma, qué evitar.

## Antes y después

Todo mezclado y sin partes:

```
Escribime algo para responderle al cliente que se quejó.
```

Armado por partes:

```
Rol: Sos un representante de atención al cliente cordial.
Contexto: El cliente se quejó por una demora de 3 días en la entrega.
Tarea: Redactá una respuesta que reconozca el error y ofrezca una solución.
Formato: Un mail listo para enviar.
Restricciones: Máximo 120 palabras, sin prometer reembolsos.
```

## Llevalo más lejos

- **Plantilla fija.** Guardá las seis etiquetas como molde y completá solo lo que cambia en cada caso.
- **Sacá lo que sobra.** Para tareas simples no necesitás las seis partes; usá las que reduzcan la ambigüedad real.
- **Ponelo en orden.** Rol y contexto arriba, tarea en el medio, formato y restricciones al final: así la IA lee primero el marco y después el pedido.
