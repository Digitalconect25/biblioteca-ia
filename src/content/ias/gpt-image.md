---
titulo: GPT Image (ChatGPT / OpenAI)
nivel: principiante
resumen: "Generación de imágenes de OpenAI dentro de ChatGPT y por API, fuerte en seguir instrucciones y poner texto."
descripcion: >
  GPT Image es el modelo de generación de imágenes de OpenAI integrado en ChatGPT y disponible
  por API. Crea imágenes desde texto y también edita las que ya tenés. Se destaca por entender
  instrucciones detalladas, renderizar texto legible y mantener coherencia entre ediciones.
comoAcceder: >
  Desde el chat de ChatGPT en chatgpt.com (web y apps de móvil): le pedís la imagen en lenguaje
  natural. Para integrarlo en tus propias apps hay una API para desarrolladores. Hay capa gratuita
  con límites; revisá la web oficial por los planes y cupos actuales.
gratis: true
planPago: Suscripción de ChatGPT con mayores límites de uso, y uso por API facturado aparte.
funciones:
  - Generar imágenes desde texto
  - Editar imágenes existentes (parcial o total)
  - Renderizar texto legible dentro de la imagen
  - Mantener la coherencia de caras y detalles entre ediciones
  - Combinar varias imágenes de referencia
casosDeUso:
  - Bocetos de productos, posters y piezas con texto
  - Editar fotos o ilustraciones con instrucciones precisas
  - Generar variantes de un mismo concepto sin perder consistencia
enlaces:
  - texto: Sitio oficial
    url: https://chatgpt.com
  - texto: Documentación de la API
    url: https://developers.openai.com/api/docs/guides/image-generation
tags: [imagenes, generativa, openai, chatgpt, edicion]
actualizado: 2026-05-28
revisarAntesDe: 2026-08-28
---

GPT Image resuelve el problema de crear y editar imágenes sin salir del chat donde ya estás trabajando. Le describís lo que querés en lenguaje natural y devuelve la imagen; si algo no encaja, le pedís el cambio puntual y conserva lo que ya estaba bien. Es para quien necesita piezas visuales con texto legible, ediciones controladas y un flujo conversacional, sin abrir un editor aparte.

## Cómo sacarle el jugo, paso a paso

1. Entrá a chatgpt.com (o la app), creá tu cuenta y pedile la imagen directamente en el chat. Hay capa gratuita con límites; mirá la web oficial por los cupos vigentes.
2. Describí sujeto, contexto y estilo en una sola instrucción clara. GPT Image sigue bien las indicaciones largas, así que no escatimes en detalle.
3. Si querés texto dentro de la imagen, escribilo entre comillas y aclarando dónde va ("el cartel dice 'ABIERTO' en letras rojas").
4. Para editar, subí tu imagen y pedí el cambio puntual ("cambiá el fondo a un bosque, dejá la persona igual"). Mantiene caras y detalles entre ediciones.
5. Iterá de a un cambio por vez: así entendés qué afecta cada instrucción y no rompés lo que ya funcionaba.
6. Para integrarlo en una app o generar en lote, usá la API para desarrolladores.

## Ejemplos de prompts

```
Poster vertical para una cafetería. Fondo color crema, una taza
humeante centrada, y arriba el texto "CAFÉ DE LA ESQUINA" en
tipografía serif marrón. Estilo ilustración plana, limpio.
```

```
Tomá esta foto de mi escritorio y cambiá la iluminación a luz
de atardecer cálida. No muevas los objetos ni cambies el encuadre.
```

```
Mockup de packaging de una caja de té, vista frontal, con la
etiqueta "TÉ VERDE ORGÁNICO" legible, fondo blanco de estudio.
```

## Trucos y errores comunes

- Para texto nítido, ponelo entre comillas y mantenelo corto: frases largas pueden salir con errores.
- Al editar, decí explícitamente qué NO debe cambiar, o el modelo puede rehacer de más.
- Aprovechá que sigue instrucciones detalladas: una descripción precisa rinde más que muchos adjetivos vagos.
- Si una cara o detalle se deforma entre ediciones, recordale que mantenga la consistencia respecto a la imagen anterior.
- No esperes resultados idénticos a una foto real al pie de la letra; verificá detalles finos antes de usarla en serio.

## Cuándo usar esta y cuándo otra

GPT Image brilla cuando necesitás texto legible, ediciones controladas y trabajar conversando dentro de ChatGPT. Para máxima calidad artística y control de estilo, Midjourney sigue siendo muy fuerte. Si tu prioridad es tipografía y diseño gráfico con texto largo, mirá Ideogram. Y si querés modelos abiertos para correr en tu propia infraestructura, FLUX es la opción.
