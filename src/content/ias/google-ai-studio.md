---
titulo: Google AI Studio
nivel: intermedio
resumen: "Banco de pruebas para los modelos Gemini: ajustás prompts y parámetros, experimentás con multimodalidad y sacás una API key gratis."
descripcion: >
  Google AI Studio es el entorno para probar de forma directa los modelos Gemini más avanzados.
  Sirve para ensayar prompts, ajustar parámetros como temperatura o tokens, experimentar con
  texto, imagen, audio y video, y obtener una API key gratis para llevar el modelo a tu propia app.
comoAcceder: >
  Entrá a aistudio.google.com con tu cuenta de Google. Es gratis y se usa desde el navegador.
  Desde ahí también generás tu API key sin costo.
gratis: true
funciones:
  - Probar los modelos Gemini con tus prompts
  - Ajustar parámetros (temperatura, tokens, etc.)
  - Experimentar con multimodalidad (texto, imagen, audio, video)
  - Obtener una API key gratis para tus proyectos
casosDeUso:
  - Afinar un prompt antes de llevarlo a producción
  - Comparar cómo responde el modelo con distintos parámetros
  - Prototipar una funcionalidad de IA en una app propia
enlaces:
  - texto: Sitio oficial
    url: https://aistudio.google.com
tags: [google, gratis, gemini, api, desarrollo]
actualizado: 2026-05-28
revisarAntesDe: 2026-08-28
---

Google AI Studio resuelve la necesidad de probar y afinar los modelos Gemini antes de meterlos en un producto. A diferencia del chat común, acá controlás parámetros como la temperatura o el límite de tokens, ves cómo cambia la respuesta y experimentás con entradas multimodales. Encima sacás una API key gratis para conectar el modelo a tu propia app. Es para desarrolladores y gente técnica que quiere ir más allá del chat.

## Cómo sacarle el jugo, paso a paso

1. Entrá a aistudio.google.com con tu cuenta de Google. Es gratis y no instalás nada.
2. Creá un prompt nuevo y elegí el modelo Gemini que quieras probar.
3. Escribí tu instrucción y ajustá parámetros: la temperatura controla cuánto "se anima" el modelo y los tokens limitan el largo de la respuesta.
4. Probá multimodalidad: sumá una imagen, audio o video junto al texto para ver cómo los interpreta.
5. Iterá sobre el prompt hasta que la salida sea consistente con lo que buscás.
6. Cuando esté pulido, generá tu API key gratis y usala para llamar al modelo desde tu app.

## Ejemplos / ideas de uso

- Afinar un prompt de clasificación probando temperaturas bajas para respuestas más estables.

```
Sos un clasificador. Devolvé solo una etiqueta: "consulta",
"reclamo" o "venta". No expliques. Mensaje del cliente:

[pegás el mensaje]
```

- Pasarle una imagen y pedirle una descripción estructurada para alimentar otro sistema.

```
Mirá esta imagen y devolveme un JSON con: objeto principal,
colores dominantes y si hay texto visible (sí/no).
```

## Trucos y errores comunes

- Temperatura alta da más variedad pero menos consistencia; para tareas formales, bajala.
- Guardá los prompts que funcionan para no rehacerlos cada vez.
- La API key es gratis, pero hay límites de uso que cambian (según Google); revisá la web oficial antes de escalar.
- No confundas el banco de pruebas (web) con la API: lo que probás acá después lo replicás en tu código.

## Cuándo conviene

Cuando vas a integrar Gemini en una app o querés controlar parámetros que el chat no expone, AI Studio es el lugar. Si solo querés chatear, escribir o generar imágenes sin tocar configuración, usá Gemini en la web. Para automatizar tareas de código en tu terminal, mirá el Gemini CLI.
