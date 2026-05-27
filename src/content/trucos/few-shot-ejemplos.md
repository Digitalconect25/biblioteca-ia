---
titulo: Enseñá con ejemplos (few-shot)
nivel: intermedio
resumen: "Dale uno o dos ejemplos de entrada y la salida que esperás. La IA copia el patrón y acierta mucho más que con instrucciones a secas."
descripcion: >
  En vez de describir lo que querés, mostralo con ejemplos de entrada y salida. Esta técnica,
  llamada few-shot, le enseña a la IA el patrón a seguir con casos concretos. Funciona
  especialmente bien para clasificar, extraer datos o imitar un estilo, donde una sola
  instrucción deja demasiado margen de interpretación.
herramienta: Todas las IAs
ejemplo: |
  Clasificá cada comentario como POSITIVO, NEGATIVO o NEUTRO.

  Comentario: "Llegó tarde pero el producto es excelente."
  Clasificación: POSITIVO

  Comentario: "No vuelvo a comprar acá."
  Clasificación: NEGATIVO

  Comentario: "Lo recibí ayer."
  Clasificación:
tags: [prompting, few-shot, ejemplos]
actualizado: 2026-05-28
---

Las instrucciones en palabras dejan margen: "clasificá el sentimiento" suena claro, pero la IA no sabe qué hacés con un comentario mixto, ni qué etiquetas usás, ni si querés explicación. Mostrarle dos o tres ejemplos resueltos elimina esa duda. La IA infiere el patrón de tus casos y lo aplica al siguiente. Es la diferencia entre explicarle una regla y dejar que la deduzca viendo cómo lo hacés vos. Por eso few-shot suele ganarle a cualquier descripción larga.

## Cómo aplicarlo

1. **Mostrá pares entrada/salida.** Cada ejemplo: el caso de entrada y exactamente la respuesta que querías para ese caso.
2. **Usá 2 o 3 ejemplos.** Con uno la IA puede no captar el patrón; con dos o tres ya lo generaliza bien.
3. **Cubrí los casos difíciles.** Incluí un ejemplo ambiguo o borde, así le enseñás qué hacer cuando dude.
4. **Mantené el formato idéntico.** Misma estructura y etiquetas en todos los ejemplos: la IA copia hasta los detalles.

## Antes y después

Solo con instrucción (zero-shot):

```
Extraé el nombre y el monto de este texto.
```

Con ejemplos (few-shot):

```
Extraé nombre y monto en formato "Nombre | Monto".

Texto: "Le transferí 5000 a Marta el lunes."
Salida: Marta | 5000

Texto: "Juan me debe 1200 pesos."
Salida: Juan | 1200

Texto: "Pagué 800 a Lucía ayer."
Salida:
```

## Llevalo más lejos

- **Ejemplos del mundo real.** Usá casos sacados de tu trabajo, no inventados: la IA aprende tu contexto exacto.
- **Few-shot para tono.** Pegá dos textos tuyos y pedile que escriba "con esa voz"; copia tu estilo, no solo la estructura.
- **Combinalo con razonamiento.** Si la tarea es difícil, mostrá ejemplos que incluyan el paso a paso, no solo la respuesta final.
