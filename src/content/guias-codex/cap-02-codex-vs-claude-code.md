---
titulo: Codex vs Claude Code
parte: Mundo Codex
n: 2
tipo: capitulo
resumen: "Comparación completa entre Codex y Claude Code: superficies, modelos, modos de aprobación, integraciones, precios y casos de uso. Cuándo conviene uno u otro, sin marketing."
objetivos:
  - Elegir entre Codex y Claude Code según el tipo de proyecto.
  - Entender en qué se parecen y en qué difieren realmente.
  - Saber cuándo conviene usar los dos a la vez.
actualizado: 2026-05-30
---

Los dos son agentes de coding "buenos en serio" hoy. Eligen estilos distintos. Resumen útil:

| Aspecto | Codex (OpenAI) | Claude Code (Anthropic) |
|---|---|---|
| Modelo base | familia GPT (gpt-5-codex y similares) | familia Claude (Opus/Sonnet) |
| Superficies | Desktop · Móvil · Web · Cloud · IDE · CLI | CLI · IDE · web · escritorio |
| Memoria de proyecto | `AGENTS.md` | `CLAUDE.md` |
| Delegación a la nube | Codex Cloud (built-in) | Sandboxes vía SDK / hospedaje propio |
| App móvil oficial | Sí (iOS y Android) | Más limitada (vía web) |
| Modos de aprobación | Auto / sugerir / aprobar cada cambio | Plan mode / acept-each / acept-edits |
| Pricing | Incluido en ChatGPT Plus/Pro/Team/Enterprise | API + plan Claude (Pro/Max) |
| Skills / Plugins | Conexiones e integraciones nativas | Skills + plugins (MCP nativo) |
| MCP (Model Context Protocol) | Soporta MCP | Nativo |

## Dónde brilla cada uno

**Codex** brilla cuando:
- Tu flujo ya está en ChatGPT (tenés ChatGPT Plus y querés un agente sin pagar otro plan).
- Querés delegar tareas largas a la nube y revisar desde el móvil. Codex Cloud es de los más sólidos
  en eso.
- Trabajás solo con repos en GitHub y querés revisión automática de PRs.
- Te gusta abrir tareas desde el celular en el commute.

**Claude Code** brilla cuando:
- Pesa más la **comprensión de contexto largo** (refactors gigantes, codebases enredados): Claude
  Opus tiende a mantener mejor el hilo en proyectos de 1M+ tokens.
- Te interesa el **ecosistema de skills/plugins/MCP** que ya están maduros.
- Querés controlar la herramienta desde la **terminal** como ciudadano de primera (Claude Code nació
  en terminal).
- Buscás un agente que sea **conservador por defecto** y te muestre el plan antes de tocar nada
  (`Plan mode`).

## Y si uso los dos

Es una jugada común. Patrones:

1. **Codex para móvil/Cloud, Claude Code para escritorio.** Delegás a Codex Cloud lo que se puede
   correr en sandbox de OpenAI; usás Claude Code en el repo local para refactors finos.
2. **Codex para code review, Claude Code para escribir.** Configurás Codex como reviewer en PRs y
   usás Claude Code para escribir los cambios.
3. **A/B por tarea.** Le pedís la misma tarea a los dos y comparás los diffs. Caro pero útil cuando
   estás eligiendo qué adoptar en tu equipo.

## Lo que NO los diferencia (en serio)

- **Velocidad bruta de generación**: ambos rinden parecido en tareas chicas. La diferencia se nota
  en tareas largas.
- **Calidad del código simple**: para CRUD y boilerplate cualquiera de los dos sirve.
- **Soporte de lenguajes**: los dos cubren bien Python, TS/JS, Go, Rust, Java, Swift, Kotlin. Lenguajes
  raros pueden tener brechas.

## La pregunta correcta

No es "cuál es mejor". Es **"cuál encaja mejor en tu flujo y tu plan que ya pagás"**. Si ya tenés ChatGPT
Plus, Codex es prácticamente gratis. Si ya tenés Claude Pro/Max, lo mismo del otro lado. Si pagás los
dos, te conviene aprovechar lo mejor de cada uno y no elegir solo uno.

> Este libro cubre Codex a fondo. Si querés profundizar en Claude Code, esta misma academia tiene un
> curso completo sobre Claude y MCP en `/cursos/automatizar-con-claude/`.
