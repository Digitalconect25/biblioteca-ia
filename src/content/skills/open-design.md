---
titulo: Open Design
nivel: avanzado
categoria: diseno
resumen: Alternativa open-source y local-first a Claude Design, con 71 sistemas de marca y 19 skills.
descripcion: >
  Open Design (de nexu-io) es la alternativa abierta y local a Claude Design de Anthropic.
  Trae 71 sistemas de diseño de marcas conocidas (Linear, Stripe, Vercel, Apple, Notion,
  Spotify y más) y 19 skills de diseño (landing SaaS, dashboard, pricing, app móvil, deck,
  informe, etc.). Se conecta a cualquier CLI que tengas en el PATH (Claude Code, Codex,
  Cursor, Gemini CLI, Copilot CLI), y si usás un modelo local, no gasta tokens.
comoUsar: >
  Una vez clonado, lo usás desde tu agente (Claude Code es el soporte principal) pidiéndole
  que diseñe una pantalla con uno de sus sistemas de marca o skills.
comoAcceder: >
  Es gratis y de código abierto. Se instala clonando el repositorio; podés pedirle a Claude
  Code que lo configure por vos.
gratis: true
comandos:
  - titulo: "Clonar el proyecto"
    comun: "git clone https://github.com/nexu-io/open-design.git"
    nota: "Funciona en Windows y Mac. Conectá un modelo local para diseñar sin gastar tokens."
funciones:
  - 71 sistemas de diseño de marca listos
  - 19 skills de diseño (landing, dashboard, deck, etc.)
  - Local-first (no gasta tokens con modelo local)
  - Compatible con Claude Code, Codex, Cursor, Gemini CLI
enlaces:
  - texto: "nexu-io/open-design (repo, 53k⭐)"
    url: https://github.com/nexu-io/open-design
  - texto: "Guía en español (tododeia)"
    url: https://www.tododeia.com/community/open-design
tags: [diseno, open-source, claude-code, local-first]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Open Design (de nexu-io) es la alternativa abierta y local a Claude Design. Trae 71 sistemas de diseño inspirados en marcas conocidas (Linear, Stripe, Vercel, Apple, Notion, Spotify y más) y 19 skills de diseño (landing SaaS, dashboard, pricing, app móvil, deck, informe, etc.). Le sirve a quien diseña con IA y quiere estilos listos para usar, y sobre todo a quien el diseño con IA le quema la cuota: al ser local-first, si conectás un modelo propio no consumís tokens.

## Cómo empezar, paso a paso

1. Es gratis y de código abierto. Se instala clonando el repositorio. Funciona en Windows y Mac.
2. Cloná el proyecto:

```bash
git clone https://github.com/nexu-io/open-design.git
```

3. Open Design se conecta a cualquier CLI que tengas en el PATH (Claude Code, Codex, Cursor, Gemini CLI, Copilot CLI). Claude Code es el soporte principal.
4. Si no querés configurarlo a mano, abrí la carpeta clonada con Claude Code y pedile que lo configure por vos.
5. Si vas a usar un modelo local, conectalo para diseñar sin gastar tokens.

## Ejemplo real

Una vez configurado, lo usás desde tu agente pidiéndole que diseñe una pantalla con uno de sus sistemas de marca o skills:

```text
> Usando Open Design, generá una landing de SaaS con el sistema de diseño de Linear.
  Incluí hero, sección de features y pricing.
```

El agente toma el sistema de marca elegido y la skill correspondiente para armar la pantalla con ese estilo.

## Trucos y errores comunes

- El sentido de local-first es no gastar tokens: solo lo lográs si conectás un modelo local. Con un modelo en la nube vas a seguir consumiendo.
- Open Design no es un agente: es una colección de sistemas y skills que tu CLI usa. Necesitás un CLI compatible ya instalado.
- Aprovechá los 71 sistemas de marca para mantener consistencia visual en vez de describir el estilo desde cero cada vez.
- Es un proyecto de nivel avanzado: conviene tener algo de experiencia con CLIs y agentes antes de meterse.

## Cuándo conviene

Conviene si querés diseñar con estilos de marca reconocibles sin depender de un servicio cerrado y, en especial, si te importa controlar el gasto de tokens con un modelo local. Frente a herramientas de diseño cerradas, su ventaja es ser abierto, gratuito y adaptable a varios CLIs.
