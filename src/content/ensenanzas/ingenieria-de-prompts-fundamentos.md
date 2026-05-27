---
titulo: Fundamentos de la ingeniería de prompts
nivel: intermedio
herramienta: Todas las IAs
tiempo: 45 min
resumen: "Armá un prompt profesional paso a paso combinando rol, contexto, ejemplos, razonamiento y formato. De pedido vago a resultado listo para usar."
descripcion: >
  La ingeniería de prompts no es magia ni trucos sueltos: es ir agregando piezas al pedido
  hasta que la IA tenga todo lo que necesita para acertar. En esta enseñanza construís un
  prompt completo capa por capa, sumando una técnica establecida en cada paso, y ves cómo
  mejora la respuesta a medida que lo refinás.
objetivo: Saber construir un prompt profesional combinando las técnicas centrales del prompting, y reconocer cuál sumar según la tarea.
requisitos:
  - Acceso a cualquier IA de chat (ChatGPT, Claude, Gemini u otra)
  - Una tarea real que quieras resolver (un mail, un resumen, una clasificación)
  - Haber leído los trucos de rol, contexto, ejemplos y formato (recomendado)
pasos:
  - titulo: "1. Escribí la tarea base"
    detalle: "Arrancá con la versión más simple del pedido, sin adornos. Es tu punto de partida para comparar. Probala tal cual y guardá la respuesta."
    comun: "Escribime un mail para avisarle a un cliente que su pedido se demora."
  - titulo: "2. Asigná un rol"
    detalle: "Agregá quién querés que sea la IA. El rol ajusta el vocabulario y el criterio de toda la respuesta."
    comun: "Actuá como un representante de atención al cliente, cordial y profesional. Escribime un mail para avisarle a un cliente que su pedido se demora."
  - titulo: "3. Sumá el contexto"
    detalle: "Decile la situación real: qué pasó, para quién es, qué tono corresponde. Sin contexto, la IA inventa los detalles."
    comun: "El pedido se demora 3 días por un problema de stock. El cliente ya escribió molesto una vez. Es un cliente habitual que valoramos."
  - titulo: "4. Mostrá un ejemplo (few-shot)"
    detalle: "Si tenés un mail anterior que salió bien, pegalo como modelo de estilo. La IA copia el tono y la estructura mejor que con cualquier descripción."
    comun: "Acá tenés un mail nuestro que funcionó bien, seguí ese mismo estilo y tono: <pegar mail de ejemplo>"
  - titulo: "5. Pedí razonamiento si la tarea lo necesita"
    detalle: "Para decisiones con varias variables (qué ofrecer, cómo priorizar), pedile que piense las opciones antes de redactar. Para un mail simple puede no hacer falta."
    comun: "Antes de escribir, pensá qué solución conviene ofrecer dado que es un cliente habitual. Después redactá el mail."
  - titulo: "6. Cerrá con formato y restricciones"
    detalle: "Definí largo, tono, qué evitar y la forma exacta de la salida. Así la respuesta llega lista para enviar."
    comun: "Devolveme solo el mail, máximo 120 palabras, sin prometer reembolsos, en español rioplatense."
  - titulo: "7. Iterá sobre el resultado"
    detalle: "Si algo no cierra, no empieces de cero: pedí un ajuste puntual sobre lo que ya tenés ('hacelo más breve', 'sacá la disculpa del principio')."
    comun: "Quedó bien, pero achicalo a 80 palabras y empezá directo con la solución."
enlaces:
  - texto: "Tutorial de prompt engineering (Anthropic)"
    url: https://github.com/anthropics/prompt-eng-interactive-tutorial
  - texto: "Guía de prompt engineering (Anthropic Docs)"
    url: https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview
  - texto: "Prompt engineering best practices (OpenAI)"
    url: https://platform.openai.com/docs/guides/prompt-engineering
tags: [prompting, fundamentos]
actualizado: 2026-05-28
revisarAntesDe: 2026-11-28
---

Al terminar vas a tener un prompt construido por capas y, sobre todo, un método: ante cualquier tarea, sabés qué pieza sumar para que la IA deje de adivinar. La idea central es simple: un buen prompt no nace perfecto, se arma. Empezás con lo mínimo y vas agregando rol, contexto, ejemplos, razonamiento y formato hasta que la respuesta sea la que necesitás. Cada paso de arriba es una técnica establecida que podés usar sola o combinada.

## Qué tener en cuenta

No siempre necesitás las siete capas. Para una clasificación rápida alcanza con un par de ejemplos; para un mail delicado, sumás rol, contexto y restricciones; para un problema con cuentas, agregás razonamiento. La habilidad no es aplicar todo siempre, sino reconocer qué le falta al pedido para que la IA no tenga que rellenar huecos.

Probá una capa por vez y compará. Si agregás cinco cosas juntas y mejora, no sabés cuál sirvió. Sumando de a una ves qué aporta cada técnica con tus tareas reales, y vas afinando el criterio. Guardá los prompts que te funcionan: tu mejor biblioteca son tus propios casos resueltos, no las plantillas genéricas de internet.

## Si algo falla

- **La respuesta es genérica.** Falta rol y contexto. Decile quién es y para quién escribe.
- **El formato no es el que querías.** Describirlo en palabras no alcanza: mostrá un ejemplo exacto de la salida.
- **Se equivoca en cuentas o lógica.** Pedile que piense paso a paso antes de concluir y revisá su razonamiento.
- **Viene demasiado larga o con relleno.** Sumá restricciones numéricas ("máximo 80 palabras") y decile qué no incluir.
- **Inventa datos.** Aclarale "si no lo sabés, decilo" y "no inventes nada que no esté en el material que te di".
- **Cada intento empeora.** Estás cambiando muchas cosas a la vez. Volvé al último prompt que funcionó e iterá de a un ajuste.

## Siguiente nivel

- Convertí tus mejores prompts en plantillas con huecos (`<acá va el contexto>`) y reusalas.
- Guardá el rol y el contexto fijo en las instrucciones personalizadas de tu IA para no repetirlos.
- Probá el mismo prompt en dos IAs distintas: vas a notar que cada una responde mejor a estructuras distintas.
- Avanzá hacia archivos de instrucciones reutilizables para tareas que repetís todas las semanas.
