---
titulo: Mostrá un ejemplo del formato que querés
nivel: principiante
resumen: Si le das un ejemplo de cómo querés la respuesta, la IA copia ese formato y acertás a la primera.
descripcion: >
  En vez de describir el formato con palabras, mostralo. Pegá un ejemplo de cómo querés que
  se vea la respuesta (una tabla, una lista, un tono) y pedí que siga ese molde. Esta técnica
  se llama "dar un ejemplo" (few-shot) y es de las que más rápido mejora los resultados.
herramienta: ChatGPT / Claude / Gemini
ejemplo: |
  Quiero un resumen en este formato exacto:

  - Tema: <una frase>
  - Para quién: <una frase>
  - Acción: <qué hacer>

  Ahora resumí este texto: ...
tags: [prompting, formato, few-shot]
actualizado: 2026-05-27
---

Describir un formato con palabras casi siempre falla: lo que vos imaginás como "una tabla prolija" la IA lo interpreta de diez maneras distintas. Mostrarle un ejemplo elimina esa ambigüedad. En vez de explicar, le das un molde y le pedís que lo rellene. Esta técnica se llama few-shot (dar uno o varios ejemplos) y es de las que más rápido mejoran los resultados, sobre todo cuando el formato importa tanto como el contenido.

## Cómo aplicarlo

1. **Armá un ejemplo del resultado que querés**, aunque sea inventado. Mostrá la estructura exacta: títulos, viñetas, columnas, tono.
2. **Usá marcadores claros** como `<acá va el tema>` para señalar qué tiene que completar la IA y qué es estructura fija.
3. **Separá el ejemplo del pedido.** Primero el molde, después "ahora hacelo con esto".
4. **Si el formato es complejo, dale dos ejemplos.** Con dos casos la IA infiere mejor el patrón que con uno solo.

## Antes y después

Describiendo el formato con palabras:

```
Resumime este texto con el tema, para quién es y qué hacer.
```

Mostrando el formato exacto:

```
Quiero el resumen en este formato exacto:

- Tema: <una frase>
- Para quién: <una frase>
- Acción concreta: <qué hacer hoy>

Ahora aplicá ese formato a este texto: <pegar acá>
```

## Llevalo más lejos

- **Ejemplo positivo y negativo.** Mostrá un caso bien hecho y uno mal hecho ("así NO lo quiero") para marcar el límite con precisión.
- **Plantillas reutilizables.** Guardá tus moldes más usados y pegalos cuando los necesites; es la base de una buena biblioteca de prompts.
- **Few-shot para tono, no solo estructura.** Pegá dos textos tuyos y pedile que escriba "con esa misma voz". Funciona muy bien para imitar tu estilo de escritura.
