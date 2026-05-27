---
titulo: Claude — cómo conectar (y crear) skills
nivel: intermedio
resumen: En Claude Code, una skill es una carpeta con un SKILL.md. La ponés en el lugar correcto y Claude la usa sola.
descripcion: >
  En Claude Code, una "skill" es simplemente una carpeta con un archivo SKILL.md dentro. Para
  conectarla, la dejás en una de dos ubicaciones: en ~/.claude/skills/ para tenerla disponible
  en todos tus proyectos, o en .claude/skills/ dentro de un proyecto para que viva solo ahí. El
  SKILL.md lleva al principio una descripción de qué hace la skill: Claude lee esa descripción
  y la usa automáticamente cuando detecta que aplica a lo que pediste. También podés invocarla
  a mano escribiendo /nombre-de-la-skill (el nombre sale de la carpeta). Las skills son una
  función de Claude Code (no de claude.ai ni de la API).
herramienta: Claude Code
ejemplo: |
  Estructura mínima de una skill:

  ~/.claude/skills/revisar-textos/SKILL.md

  Dentro de SKILL.md:
  ---
  description: Revisa textos en español y corrige ortografía, claridad y tono.
  ---
  Cuando te pasen un texto, corregí ortografía y gramática,
  mejorá la claridad y mantené el tono original. Devolvé el
  texto corregido y una lista breve de los cambios.
comandos:
  - titulo: "Crear una skill personal (todos tus proyectos)"
    mac: "mkdir -p ~/.claude/skills/mi-skill"
    windows: "mkdir $HOME\\.claude\\skills\\mi-skill"
    nota: "Después creá el archivo SKILL.md dentro de esa carpeta."
  - titulo: "Crear una skill solo para un proyecto"
    comun: "mkdir -p .claude/skills/mi-skill"
    nota: "Se ejecuta dentro de la carpeta del proyecto. En Windows (PowerShell) también funciona mkdir."
enlaces:
  - texto: Documentación de Skills (Claude Code)
    url: https://code.claude.com/docs/en/skills
tags: [claude, claude-code, skills, agentes, prompting]
actualizado: 2026-05-27
revisarAntesDe: 2026-08-27
---

La clave está en la descripción del SKILL.md: cuanto más clara sea, mejor decidirá Claude
cuándo usar la skill. Pensala como el "cuándo me tenés que llamar" de tu especialista.
