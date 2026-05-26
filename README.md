# Biblioteca IA

Web interactiva y **gratuita** para aprender IA en español: skills, MCPs y las IAs más
usadas, explicadas por niveles (principiante → avanzado). Construida con [Astro](https://astro.build).

## Empezar (desarrollo)

Requiere **Node 20+** (ver `.nvmrc`).

```bash
npm install
npm run dev      # http://localhost:4321
```

> Nota: el índice de búsqueda full-text (Pagefind) se genera en `npm run build`.
> En `npm run dev`, el filtrado y la búsqueda por texto del **catálogo** funcionan igual
> (son del lado del cliente). Para probar el sitio compilado: `npm run build && npm run preview`.

## Estructura

- `src/content.config.ts` — esquema (Zod) de las colecciones: `skills`, `mcps`, `ias`, `rutas`.
- `src/content/<coleccion>/*.md` — el contenido (una ficha por archivo; el nombre = slug).
- `src/pages/` — páginas (home, catálogo, detalle, rutas, aportar).
- `src/components/`, `src/layouts/` — UI.
- `plantillas/` — plantillas comentadas para crear fichas nuevas (fuera de `src/content/`).

## Aportar

Mirá [CONTRIBUTING.md](./CONTRIBUTING.md). En resumen: copiá una plantilla de `plantillas/`
a la carpeta correspondiente, completala y abrí un Pull Request. La validación automática
revisa el formato.

## Licencia

Contenido y código abiertos (MIT).
