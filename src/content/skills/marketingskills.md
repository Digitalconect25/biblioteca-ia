---
titulo: Marketing Skills (coreyhaines31)
nivel: intermedio
categoria: marketing
resumen: Pack de 33+ skills de marketing para Claude Code (copy, SEO, CRO, ads, email y más).
descripcion: >
  Un pack de skills de marketing creado por Corey Haines que le enseña a Claude Code a
  trabajar como un equipo de marketing: copywriting, estrategia de contenidos, CRO,
  anuncios, email, pricing y psicología de marketing. Se instala con un comando y quedan
  disponibles globalmente.
comoUsar: >
  Tras instalarlo, pedile a Claude tareas de marketing y usa la skill que corresponda
  (por ejemplo redactar una landing, armar una secuencia de email o auditar SEO).
comoAcceder: >
  Se instala con el CLI "skills" (npx) apuntando al repo. Cuando aparece la lista, marcá
  todas con la tecla A, confirmá con Enter, elegí Claude Code como agente y Global como scope.
gratis: true
comandos:
  - titulo: "Instalar el pack"
    comun: "npx skills add coreyhaines31/marketingskills"
    nota: "En la lista: tecla A para marcar todas, Enter, elegí Claude Code y scope Global."
funciones:
  - Copywriting y edición de copy
  - SEO, CRO y estrategia de contenidos
  - Anuncios (Meta, Google, LinkedIn) y email
  - Pricing, lanzamientos y psicología de marketing
enlaces:
  - texto: "coreyhaines31/marketingskills (repo)"
    url: https://github.com/coreyhaines31/marketingskills
tags: [skills, marketing, claude-code, pack]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Este pack convierte a Claude Code en tu equipo de marketing: trae skills de copywriting, estrategia de contenidos, CRO, anuncios, email, pricing y psicología de marketing. Le sirve a fundadores, marketers solos y agencias chicas que quieren producir material sin saltar entre diez herramientas distintas. Todo queda disponible de forma global una vez instalado.

## Cómo instalarlo y usarlo, paso a paso

1. Asegurate de tener Node instalado (para poder usar `npx`).
2. Corré el comando de instalación:

```
npx skills add coreyhaines31/marketingskills
```

3. Cuando aparezca la lista de skills, apretá la tecla `A` para marcarlas todas y confirmá con `Enter`.
4. Elegí **Claude Code** como agente y **Global** como scope, así las tenés en cualquier proyecto.
5. Para el primer uso, abrí Claude y arrancá por el contexto base de product-marketing: es el que leen las demás skills antes de trabajar.

## Ejemplo real

Querés una landing para un producto nuevo. Después de cargar el contexto de marketing, pedís:

```
Escribí el copy de una landing para mi app de gestión de turnos.
Usá la skill de copywriting y dame hero, beneficios y CTA.
```

Claude toma el contexto, aplica la skill de copy y te devuelve la estructura lista para editar.

## Trucos y errores comunes

- No saltees el contexto de marketing: sin él, las skills trabajan a ciegas y el copy sale genérico.
- Nombrá la skill que querés ("usá la de CRO", "usá la de email") cuando la tarea sea específica; ayuda a que elija bien.
- Mantené el repo actualizado: volvé a correr el comando cada tanto para traer mejoras y skills nuevas.
- No esperes que reemplace tu criterio: revisá siempre el copy antes de publicarlo.

## Cuándo conviene

Para quien hace marketing en Claude Code y quiere un set amplio y coherente de habilidades en un solo lugar. Ideal si sos fundador, marketer independiente o trabajás en una agencia chica y producís copy, contenido y campañas seguido.
