---
titulo: Claude SEO (AgriciDaniel)
nivel: intermedio
categoria: seo
resumen: Pack de 14 skills de SEO para Claude Code, con auditorías en paralelo y enfoque AI-search.
descripcion: >
  Pack de skills de SEO que convierte a Claude Code en un especialista: análisis global,
  auditoría técnica, contenido, SEO local, schema, sitemaps y optimización para buscadores
  con IA (AI Overviews). Incluye sub-agentes que corren en paralelo, así una auditoría de
  sitio completo baja de horas a minutos.
comoUsar: >
  Pedile a Claude una auditoría o tarea de SEO; la skill correspondiente se encarga. Para
  un sitio entero, la auditoría lanza varios sub-agentes a la vez.
comoAcceder: >
  Se instala con el CLI "skills" apuntando al repo, con scope global.
gratis: true
comandos:
  - titulo: "Instalar el pack"
    comun: "npx skills add AgriciDaniel/claude-seo --global"
funciones:
  - Auditoría SEO con puntaje 0-100
  - SEO técnico (Core Web Vitals, crawl, indexación)
  - Contenido, schema, sitemaps y hreflang
  - Optimización para AI Overviews (seo-geo)
enlaces:
  - texto: "AgriciDaniel/claude-seo (repo)"
    url: https://github.com/AgriciDaniel/claude-seo
tags: [skills, seo, claude-code, pack]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Este pack convierte a Claude Code en un especialista de SEO: trae skills para análisis global, auditoría técnica, contenido, SEO local, schema, sitemaps, hreflang y optimización para buscadores con IA (AI Overviews). Usa sub-agentes que corren en paralelo, así una auditoría de sitio entero baja de horas a minutos. Le sirve a quien quiere SEO serio sin saltar entre varias herramientas.

## Cómo instalarlo y usarlo, paso a paso

1. Verificá que tengas Node para poder correr `npx`.
2. Instalalo con scope global:

```
npx skills add AgriciDaniel/claude-seo --global
```

3. Abrí Claude Code y pedile una tarea de SEO. La skill que corresponda se activa sola.
4. Para arrancar, una auditoría completa es el mejor primer uso: lanza varios sub-agentes a la vez y te deja un informe accionable.

## Ejemplo real

Tenés un sitio y querés saber qué arreglar. Pedís:

```
Hacé una auditoría SEO completa de mi sitio y dame un informe
priorizado con puntaje y los problemas técnicos más urgentes.
```

Claude corre los sub-agentes en paralelo (técnico, contenido, schema, etc.) y arma un informe con el puntaje 0-100 y la lista de acciones.

## Trucos y errores comunes

- Para sitios grandes, dejá que termine la auditoría completa antes de pedir cambios: el informe global te ordena las prioridades.
- Si solo te interesa una parte (por ejemplo schema o Core Web Vitals), pedila explícitamente para no correr todo.
- No apliques todas las recomendaciones a ciegas: revisá impacto y esfuerzo antes de tocar el sitio.
- Mantené el pack actualizado para seguir las novedades de SEO con IA.

## Cuándo conviene

Para quien gestiona el SEO de uno o varios sitios y quiere ejecutar auditorías y tareas técnicas desde Claude Code, con resultados rápidos gracias al trabajo en paralelo. Útil tanto para SEOs como para developers que quieren cubrir lo técnico sin armar un stack aparte.
