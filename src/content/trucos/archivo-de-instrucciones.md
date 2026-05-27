---
titulo: Usá un archivo de instrucciones para tu agente
nivel: avanzado
resumen: Un archivo como CLAUDE.md o AGENTS.md le da reglas estables a tu agente y resultados consistentes.
descripcion: >
  Si usás un agente de código (Claude Code, Cursor, Copilot), poné las reglas de tu proyecto
  en un archivo de instrucciones (CLAUDE.md o AGENTS.md en la raíz del repo): cómo se llama el
  proyecto, qué comandos usar, el estilo de código, qué NO tocar. El agente lo lee solo y deja
  de improvisar. Es la diferencia entre un agente que adivina y uno que sigue tu forma de trabajar.
herramienta: Claude Code / Cursor / Copilot
ejemplo: |
  # CLAUDE.md
  - Proyecto: tienda online en Astro.
  - Comandos: `npm run dev`, `npm run build`.
  - Estilo: TypeScript estricto, sin dependencias nuevas sin avisar.
  - No toques la carpeta /legacy.
enlaces:
  - texto: "awesome-claude-code (ejemplos de CLAUDE.md y más)"
    url: https://github.com/hesreallyhim/awesome-claude-code
tags: [automatizacion, agentes, claude-code, productividad]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Sin un archivo de instrucciones, cada sesión arranca de cero: le repetís al agente cómo se llama el proyecto, qué comandos usar y qué no tocar, y aun así improvisa. Un archivo como `CLAUDE.md` o `AGENTS.md` en la raíz del repo concentra esas reglas en un solo lugar que el agente lee solo al empezar. Es la diferencia entre uno que adivina tu forma de trabajar y uno que ya la conoce. Escribís las reglas una vez y se aplican en cada sesión.

## Cómo aplicarlo

1. **Creá el archivo en la raíz.** `CLAUDE.md` para Claude Code, `AGENTS.md` para varios agentes. Ahí lo busca solo.
2. **Empezá por lo esencial.** Qué es el proyecto, su stack y los comandos clave (cómo levantarlo, cómo testear, cómo buildear).
3. **Escribí las reglas como órdenes.** "Usá TypeScript estricto", "no agregues dependencias sin avisar", "no toques `/legacy`". Cortas y claras.
4. **Mantenelo corto y vivo.** Si una regla deja de valer, borrala. Un archivo inflado se ignora; uno preciso se respeta.

## Antes y después

Sin archivo, lo repetís en cada chat:

```
Acordate: esto es Astro, usá TS estricto, no instales nada
sin preguntar y no toques la carpeta legacy... (otra vez)
```

Con archivo, lo escribís una vez:

```
# CLAUDE.md
- Proyecto: tienda online en Astro.
- Comandos: `npm run dev`, `npm run build`.
- Estilo: TypeScript estricto, sin dependencias nuevas sin avisar.
- No toques la carpeta /legacy.
```

## Llevalo más lejos

- **Reglas por carpeta.** Algunos agentes leen archivos de instrucciones anidados; poné reglas específicas dentro del módulo al que aplican.
- **Documentá las decisiones, no solo el estilo.** Anotá por qué algo es como es ("no migrar a X porque rompe Y"); evita que el agente "arregle" lo que no debe.
- **Versionalo con el repo.** Al estar en git, el archivo evoluciona con el proyecto y todo el equipo (y cada agente) trabaja con las mismas reglas.
