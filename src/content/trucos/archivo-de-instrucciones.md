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

Es el truco que más sube la calidad cuando trabajás seguido con un agente: escribís las
reglas una vez y se aplican en cada sesión.
