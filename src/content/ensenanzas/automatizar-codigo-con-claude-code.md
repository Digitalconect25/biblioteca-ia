---
titulo: Automatizar tareas de código con Claude Code
nivel: intermedio
herramienta: Claude Code
tiempo: 20 min
resumen: Instalá Claude Code y dejá que construya o arregle tu código por vos, conversando.
descripcion: >
  Claude Code es un agente que vive en tu terminal: lee tu proyecto, edita archivos y corre
  comandos. En esta enseñanza lo instalás y le hacés completar una tarea de código real, de
  principio a fin, aprobando vos cada cambio importante.
objetivo: Que Claude implemente o arregle algo concreto en tu proyecto, con tu aprobación en cada paso.
requisitos:
  - Una cuenta de pago de Anthropic (Pro, Max, Team o Enterprise)
  - Una terminal (PowerShell en Windows, Terminal en Mac)
  - Un proyecto donde trabajar (puede ser una carpeta vacía con git)
pasos:
  - titulo: "1. Instalar Claude Code"
    detalle: "Usá el instalador nativo según tu sistema. Se actualiza solo."
    windows: "irm https://claude.ai/install.ps1 | iex"
    mac: "curl -fsSL https://claude.ai/install.sh | bash"
  - titulo: "2. Abrir tu proyecto e iniciar Claude"
    detalle: "Entrá a la carpeta del proyecto y arrancá la sesión. La primera vez te pide iniciar sesión en el navegador."
    comun: |
      cd mi-proyecto
      claude
  - titulo: "3. Pedir la tarea en lenguaje natural"
    detalle: "Describí qué querés lograr, con contexto. Claude propone los cambios antes de aplicarlos."
    comun: 'Agregá una página de contacto con un formulario (nombre, email, mensaje) y validación básica. Mostrame el plan antes de tocar archivos.'
  - titulo: "4. Revisar y aprobar los cambios"
    detalle: "Claude pide permiso para acciones sensibles (editar archivos, correr comandos). Revisá cada diff y aprobá o pedí ajustes."
  - titulo: "5. Pedir pruebas y dejarlo verificar"
    detalle: "Hacé que corra el proyecto o las pruebas para confirmar que funciona; si algo falla, pedile que lo arregle."
    comun: 'Corré el proyecto y arreglá cualquier error que aparezca. Después resumime qué cambiaste.'
enlaces:
  - texto: "anthropics/claude-code (repo oficial, 127k⭐)"
    url: https://github.com/anthropics/claude-code
  - texto: "Guía de Claude Code"
    url: https://code.claude.com/docs
  - texto: "awesome-claude-code (skills, hooks, comandos)"
    url: https://github.com/hesreallyhim/awesome-claude-code
tags: [automatizacion, claude-code, programacion, agente]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Al terminar vas a tener a Claude Code resolviendo una tarea real en tu proyecto, de punta a punta, sin que sueltes el control: vos aprobás cada cambio que importa. Eso te ahorra el ida y vuelta de copiar y pegar entre el chat y el editor, y te deja delegar lo aburrido para concentrarte en decidir.

## Qué tener en cuenta

Claude Code consume cuota de tu plan según el tamaño del proyecto y la cantidad de archivos que lee. Una sesión larga en un repo grande gasta más rápido que varias preguntas cortas, así que conviene arrancar en una carpeta acotada.

Antes de empezar, asegurate de que tu proyecto esté bajo control de versiones. Si la carpeta todavía no es un repo, inicializalo:

```
git init
```

Así, si un cambio no te gusta, lo revertís sin drama. Claude pide permiso para editar archivos y correr comandos: leé qué va a hacer antes de aprobar, sobre todo cuando toca borrar o instalar dependencias. No le des por sentado que entiende el negocio; cuanto más contexto le des (qué framework usás, qué convención de nombres, qué no debe tocar), mejor sale el resultado.

## Si algo falla

- **El comando `claude` no se reconoce.** Cerrá y reabrí la terminal para que tome el PATH actualizado. Si sigue sin aparecer, reinstalá con el instalador de tu sistema.
- **No abre el navegador para iniciar sesión.** Copiá a mano la URL que imprime la terminal y pegala en el navegador donde ya tenés tu cuenta de Anthropic abierta.
- **Edita archivos que no querías.** Frenalo, revertí con `git checkout .` y volvé a pedir la tarea aclarando qué archivos o carpetas no debe tocar.
- **Dice que terminó pero el proyecto no corre.** Pedile explícitamente que ejecute el proyecto o las pruebas y que arregle los errores que aparezcan, en vez de confiar en su resumen.
- **Se queda sin contexto en tareas largas.** Dividí el pedido en pasos chicos y empezá una sesión nueva cuando cambies de objetivo.

## Siguiente nivel

- Creá un archivo `CLAUDE.md` en la raíz con las reglas de tu proyecto (estilo, comandos, qué evitar); Claude lo lee solo al arrancar.
- Sumale skills y MCPs para darle capacidades extra (ver la enseñanza de equipar Claude Code).
- Conectalo a tu repo de GitHub para que actúe directo en issues y PRs (ver la enseñanza de automatizar GitHub).
