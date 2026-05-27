---
titulo: Antigravity Awesome Skills
nivel: avanzado
categoria: pack
resumen: Mega-pack de 900+ skills para Claude y otros agentes (Google, pagos, automatización, docs).
descripcion: >
  Es probablemente el pack de skills más grande que existe: cientos de habilidades para
  productividad (Google Workspace, Notion, Slack), pagos (Stripe, PayPal), automatización
  (n8n, Make, Zapier), documentos (docx, pdf, pptx, xlsx), despliegue (Vercel, Supabase),
  imagen y video. Compatible con Claude Code, Cursor, Codex y muchos agentes más.
comoUsar: >
  Al instalar te deja elegir categorías. Después pedile a Claude tareas de esas áreas y usa
  la skill que corresponda. Ocupa bastante espacio (cientos de subcarpetas), así que conviene
  instalar solo las categorías que vas a usar.
comoAcceder: >
  Se instala con su propio comando npx. Podés traer todo o solo una skill puntual.
gratis: true
comandos:
  - titulo: "Instalar (elegís categorías)"
    comun: "npx antigravity-awesome-skills --claude"
  - titulo: "Instalar solo una skill puntual"
    comun: |
      npx antigravity-awesome-skills --claude --skill image-generation
      npx antigravity-awesome-skills --claude --skill video-editing
funciones:
  - Productividad (Google, Notion, Slack, Trello, etc.)
  - Pagos (Stripe, PayPal, Plaid, Square)
  - Automatización (n8n, Make, Zapier)
  - Documentos, despliegue, imagen y video
enlaces:
  - texto: "agentic-skills/antigravity-awesome-skills (repo)"
    url: https://github.com/agentic-skills/antigravity-awesome-skills
tags: [skills, pack, automatizacion, productividad]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Es probablemente el pack de skills más grande que existe: cubre productividad (Google Workspace, Notion, Slack, Trello), pagos (Stripe, PayPal, Plaid, Square), automatización (n8n, Make, Zapier), documentos (docx, pdf, pptx, xlsx), despliegue, imagen y video. Es compatible con Claude Code, Cursor, Codex y muchos agentes más. Le sirve a quien quiere un repertorio amplio y no quiere instalar packs sueltos uno por uno.

## Cómo instalarlo y usarlo, paso a paso

1. Verificá que tengas Node para usar `npx`.
2. Instalá eligiendo categorías:

```
npx antigravity-awesome-skills --claude
```

3. Marcá solo las categorías que vas a usar. Ocupa bastante espacio (cientos de subcarpetas), así que conviene no traer todo.
4. Si solo querés una skill puntual, instalala directo:

```
npx antigravity-awesome-skills --claude --skill image-generation
npx antigravity-awesome-skills --claude --skill video-editing
```

5. Después abrí Claude y pedile tareas de esas áreas; usa la skill que corresponda.

## Ejemplo real

Necesitás generar una imagen para un post. Instalás solo esa skill y pedís:

```
Generá una imagen de portada para un artículo sobre productividad,
estilo minimalista, formato horizontal.
```

Claude usa la skill de generación de imagen sin tener que cargar todo el resto del pack.

## Trucos y errores comunes

- No instales todo de una: vas a llenar la carpeta de skills con cientos de cosas que no vas a tocar.
- Si necesitás algo concreto, usá `--skill` para traer solo esa habilidad.
- Revisá qué credenciales pide cada integración (pagos, Google, etc.) antes de usarla en producción.
- Limpiá categorías que dejaste de usar para mantener el entorno liviano.

## Cuándo conviene

Para usuarios avanzados que tocan muchas áreas distintas (productividad, pagos, automatización, documentos) y quieren un único origen de skills. Si solo necesitás una o dos cosas, mejor instalá skills puntuales en vez del pack completo.
