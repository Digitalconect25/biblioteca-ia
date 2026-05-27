---
titulo: Acotá con restricciones y pedí un formato exacto
nivel: intermedio
resumen: "Decile el largo, el tono y qué evitar, y pedí la salida en un formato exacto. La respuesta te llega lista para usar."
descripcion: >
  Una respuesta abierta casi siempre necesita edición: viene muy larga, con un tono que no es,
  o en un formato que no te sirve. Poner restricciones (largo, tono, qué evitar) y pedir un
  formato de salida exacto (lista, tabla, JSON) hace que la IA te entregue algo listo para
  pegar y usar, sin retoques.
herramienta: Todas las IAs
ejemplo: |
  Resumí esta nota en exactamente 3 viñetas.
  Cada viñeta: máximo 15 palabras, en tono neutro, sin adjetivos.
  No agregues introducción ni cierre. Devolvé solo las viñetas.

  Nota: ...
tags: [prompting, formato, restricciones]
actualizado: 2026-05-28
---

Sin límites, la IA tiende a explayarse: te devuelve tres párrafos cuando querías tres líneas, con introducción, conclusión y disculpas de regalo. Después editás vos. Las restricciones le marcan el cauce (cuánto, en qué tono, qué evitar) y el formato le marca la forma exacta (lista, tabla, JSON, una sola frase). Juntos convierten una respuesta "más o menos" en una que pegás directo donde la necesitás. Cuanto más exacto el pedido, menos trabajo te queda.

## Cómo aplicarlo

1. **Poné números, no adjetivos.** "Máximo 50 palabras" o "exactamente 5 ítems" funciona mejor que "que sea corto".
2. **Definí el formato de salida.** Lista, tabla con columnas nombradas, JSON, viñetas. Si va a una planilla o un sistema, especificá la estructura.
3. **Decile qué NO querés.** "Sin introducción", "sin emojis", "no inventes datos". Las restricciones negativas evitan el relleno.
4. **Pedí solo la salida.** "Devolvé únicamente la tabla, sin explicaciones" te ahorra recortar después.

## Antes y después

Pedido abierto:

```
Haceme una comparación entre estos tres planes.
```

Con restricciones y formato exacto:

```
Compará estos tres planes en una tabla.
Columnas: Plan | Precio | Para quién | Límite principal.
Una fila por plan, máximo 8 palabras por celda.
Sin texto antes ni después de la tabla.

Planes: ...
```

## Llevalo más lejos

- **Mostrá el molde.** Combiná con un ejemplo del formato exacto (few-shot): es la forma más segura de que respete la estructura.
- **Formato para máquinas.** Pedí JSON con campos definidos cuando la salida alimenta otra herramienta o una planilla.
- **Forzá el arranque.** Terminá tu prompt con el inicio de la respuesta (por ejemplo `{` o `- `) para que la IA continúe en ese formato.
