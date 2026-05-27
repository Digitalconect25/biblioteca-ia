---
titulo: FLUX (Black Forest Labs)
nivel: intermedio
resumen: "Familia de modelos de imagen de Black Forest Labs, con versiones de pesos abiertos para correr donde quieras."
descripcion: >
  FLUX es la familia de modelos de generación y edición de imágenes de Black Forest Labs, un
  laboratorio alemán. Ofrece versiones de pesos abiertos que podés descargar y correr en tu propia
  infraestructura, además de un playground para probar y una API para producción. Es la opción
  preferida de quien quiere control técnico y personalización.
comoAcceder: >
  De tres formas: probarlo sin código en el playground oficial (playground.bfl.ai), integrarlo por
  API para producción, o descargar los pesos abiertos desde Hugging Face y GitHub para correrlo en tu
  propia máquina. Hay opciones gratuitas para experimentar; revisá la web oficial por los términos.
gratis: true
planPago: Uso por API facturado según volumen, y modelos de mayor capacidad en niveles superiores.
funciones:
  - Generar imágenes desde texto con alta calidad
  - Editar imágenes (rellenado, expandido, guías de estructura)
  - Modelos de pesos abiertos para correr localmente
  - Versiones rápidas (pocos pasos) y versiones de máxima calidad
  - Control con imágenes de referencia y mapas de profundidad o bordes
casosDeUso:
  - Integrar generación de imágenes en una app o producto propio
  - Correr el modelo en infraestructura propia con datos privados
  - Personalizar y ajustar el modelo a un estilo o caso específico
enlaces:
  - texto: Sitio oficial
    url: https://bfl.ai
  - texto: Modelos de pesos abiertos (Hugging Face)
    url: https://huggingface.co/black-forest-labs
  - texto: Repositorio oficial (GitHub)
    url: https://github.com/black-forest-labs/flux
tags: [imagenes, generativa, codigo-abierto, api, desarrolladores]
actualizado: 2026-05-28
revisarAntesDe: 2026-08-28
---

FLUX resuelve el problema de tener una IA de imágenes potente pero bajo tu control: podés probarla en un playground, integrarla por API o, lo que la distingue, descargar los pesos abiertos y correrla en tu propia máquina o servidor. Es para desarrolladores, estudios y quien necesita personalizar el modelo, trabajar con datos privados o no depender de una nube ajena. Requiere algo más de conocimiento técnico que un chat común.

## Cómo sacarle el jugo, paso a paso

1. Para una prueba rápida sin instalar nada, entrá al playground oficial en playground.bfl.ai y generá desde el navegador.
2. Elegí la variante según tu necesidad: hay versiones rápidas (pocos pasos, ideales para iterar) y versiones de máxima calidad para el render final.
3. Para integrarlo en tu producto, usá la API: describís la imagen, el tamaño y la proporción, y la recibís lista para tu app.
4. Si querés control total, descargá los pesos abiertos desde Hugging Face o GitHub y corré el modelo en tu propia infraestructura (necesitás una GPU adecuada).
5. Para edición, usá las herramientas de la familia: rellenado y expandido de imagen, y guías de estructura con bordes o profundidad.
6. Empezá con prompts simples y agregá detalle de a poco; con modelos abiertos podés además ajustar parámetros técnicos del muestreo.

## Ejemplos de prompts

```
A photorealistic portrait of an old fisherman, weathered skin,
golden hour light, shallow depth of field, 85mm lens, sharp focus
on the eyes, neutral background.
```

```
Ilustración isométrica de una pequeña isla flotante con una casa
y un árbol, estilo render 3D limpio, paleta pastel, fondo celeste,
proporción cuadrada.
```

```
A product shot of a glass perfume bottle on a marble surface,
soft studio lighting, reflections, high detail, ultra realistic,
1:1 aspect ratio.
```

## Trucos y errores comunes

- Usá las versiones rápidas para tantear ideas y reservá las de máxima calidad para el render final: ahorrás tiempo y recursos.
- Para correr los pesos abiertos hace falta una GPU con buena memoria; no esperes que ande en cualquier notebook.
- Revisá la licencia de cada variante antes de usarla con fines comerciales: no todas tienen los mismos términos.
- Aprovechá las herramientas de edición (rellenado, expandido, guías) en vez de regenerar todo desde cero.
- Como todo modelo, puede fallar en texto y en detalles finos; verificá antes de usarlo en producción.

## Cuándo usar esta y cuándo otra

FLUX es la mejor opción cuando querés control técnico: API propia, pesos abiertos, datos privados o personalización. Si buscás calidad artística sin complicarte, Midjourney es más directo. Para editar fotos conversando elegí Nano Banana o GPT Image; y si lo central es el texto dentro de la imagen, Ideogram es la herramienta indicada.
