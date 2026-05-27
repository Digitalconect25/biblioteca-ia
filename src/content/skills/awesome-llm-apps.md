---
titulo: awesome-llm-apps (100+ agentes)
nivel: intermedio
categoria: referencia
resumen: Repositorio con 100+ agentes de IA listos para clonar y usar, en 13 categorías.
descripcion: >
  awesome-llm-apps (de Shubhamsaboo) es uno de los repositorios de IA más populares: una
  colección de más de 100 apps y agentes de IA con su código, organizados por categoría
  (asistentes, RAG, automatización, etc.). En vez de construir desde cero, clonás el agente
  que te sirve y lo adaptás. Es referencia obligada para ver cómo se arman agentes reales.
comoUsar: >
  Explorá el repo, elegí un agente que resuelva tu caso, cloná el repositorio y seguí su
  README. Podés pedirle a Claude Code que te ayude a encontrar e instalar el indicado.
comoAcceder: >
  Es gratis y de código abierto. Se accede desde GitHub; cada agente trae sus instrucciones.
gratis: true
comandos:
  - titulo: "Clonar el repositorio"
    comun: "git clone https://github.com/Shubhamsaboo/awesome-llm-apps.git"
funciones:
  - 100+ agentes de IA con código
  - 13 categorías (asistentes, RAG, automatización, etc.)
  - Ejemplos reales para aprender a construir agentes
enlaces:
  - texto: "Shubhamsaboo/awesome-llm-apps (repo, 112k⭐)"
    url: https://github.com/Shubhamsaboo/awesome-llm-apps
  - texto: "Guía en español (tododeia)"
    url: https://www.tododeia.com/community/awesome-llm-apps
tags: [repositorio, agentes, referencia, codigo-abierto]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

awesome-llm-apps (de Shubhamsaboo) es una colección de más de 100 apps y agentes de IA con su código, organizados en 13 categorías (asistentes, RAG, automatización y más). En vez de construir desde cero, clonás el agente que te sirve y lo adaptás. Le sirve a quien quiere aprender cómo se arman agentes reales y a quien necesita un punto de partida concreto para su propio proyecto.

## Cómo empezar, paso a paso

1. Es gratis y de código abierto. Se accede desde GitHub y cada agente trae sus propias instrucciones.
2. Entrá al repo y recorré las categorías para encontrar un agente parecido a lo que querés hacer.
3. Cloná el repositorio:

```bash
git clone https://github.com/Shubhamsaboo/awesome-llm-apps.git
```

4. Entrá a la carpeta del agente que elegiste y leé su README: cada uno explica qué dependencias necesita y cómo correrlo.
5. Si no sabés cuál elegir, abrí la carpeta con Claude Code y pedile que te ayude a encontrar e instalar el indicado.

## Ejemplo real

El repo tiene muchas subcarpetas, una por agente. El flujo típico, una vez clonado, es entrar a la del agente que te interesa e instalar sus dependencias siguiendo el README:

```bash
cd awesome-llm-apps
# entrás a la carpeta del agente que elegiste y seguís su README
```

A partir de ahí adaptás el código a tu caso: cambiás el prompt, conectás tu fuente de datos o ajustás la lógica.

## Trucos y errores comunes

- Cada agente tiene su propio README y sus dependencias. No asumas que el mismo comando sirve para todos.
- Muchos agentes piden claves de API de servicios externos. Configuralas en variables de entorno, nunca pegadas en el código.
- Es un repo de ejemplos para aprender y partir de ahí, no un producto terminado. Esperá tener que tocar código.
- Mirá la fecha de los ejemplos: algunos pueden usar versiones de librerías que ya cambiaron.

## Cuándo conviene

Conviene cuando vas a construir un agente y querés ver cómo lo resolvió otra gente antes de empezar. Frente a arrancar de cero, partir de un ejemplo funcional te ahorra tiempo y te muestra patrones reales. Para producción vas a tener que adaptar y endurecer el código.
