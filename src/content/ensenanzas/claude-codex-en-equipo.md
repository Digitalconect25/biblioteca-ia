---
titulo: Usá Claude y Codex en equipo
nivel: avanzado
herramienta: Claude Code + Codex
tiempo: 20 min
resumen: Hacé que Claude Code y Codex de OpenAI trabajen juntos en la misma carpeta y se complementen.
descripcion: >
  Claude Code (Anthropic) y Codex (OpenAI) no compiten: usados juntos en el mismo proyecto
  rinden más. Una idea común es que Claude planee y construya, y Codex audite o "rescate"
  cuando Claude se traba. Hay dos caminos para conectarlos, y un plugin oficial que agrega
  comandos de revisión cruzada.
objetivo: Tener Claude y Codex coordinados en un proyecto, con revisión cruzada de código.
requisitos:
  - Claude Code instalado y con cuenta de pago
  - Codex (cuenta de OpenAI / ChatGPT)
  - Node.js instalado
pasos:
  - titulo: "1. Instalar el Codex CLI"
    detalle: "Instalá la CLI de Codex. También podés usar la terminal embebida de la app de ChatGPT."
    comun: "npm install -g @openai/codex"
  - titulo: "2. Camino A — desde Codex"
    detalle: "En la app de ChatGPT, abrí la terminal embebida (Cmd+J en Mac) y corré Claude ahí, así viven en la misma carpeta."
    comun: "claude"
  - titulo: "3. Camino B — plugin oficial en Claude Code"
    detalle: "Instalá el plugin openai/codex-plugin-cc (ver el repo para los pasos exactos). Desbloquea comandos como /codex:review, /codex:adversarial-review y /codex:rescue."
  - titulo: "4. Usarlos en equipo"
    detalle: "Patrón típico: Claude planea y construye; antes de commitear, pedís a Codex que audite. Si Claude se atora, usás el rescate de Codex."
    comun: '/codex:review'
enlaces:
  - texto: "openai/codex-plugin-cc (plugin, 20k⭐)"
    url: https://github.com/openai/codex-plugin-cc
  - texto: "openai/codex (Codex CLI)"
    url: https://github.com/openai/codex
  - texto: "Guía en español (tododeia)"
    url: https://www.tododeia.com/community/claude-codex-equipo
tags: [automatizacion, claude-code, codex, revision]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Al terminar vas a tener a Claude Code y a Codex de OpenAI trabajando sobre la misma carpeta, con revisión cruzada de código. La idea no es elegir uno: es que Claude planee y construya, y Codex audite o rescate cuando Claude se traba. Dos modelos distintos mirando el mismo problema atrapan errores que uno solo deja pasar.

## Qué tener en cuenta

Son dos cuentas y dos cuotas separadas: Claude consume tu plan de Anthropic, Codex el de OpenAI o ChatGPT. Si usás los dos intensivamente, vas a gastar de ambos lados, así que tenelo en cuenta antes de armar flujos automáticos.

Hay dos caminos para conectarlos y conviene elegir según tu costumbre. El Camino A (correr `claude` dentro de la terminal embebida de ChatGPT) es simple y los deja en la misma carpeta sin instalar nada extra. El Camino B (el plugin oficial) te da comandos dedicados como `/codex:review`, `/codex:adversarial-review` y `/codex:rescue` directo en Claude Code. El plugin se instala desde dentro de Claude Code; revisá el repo para los pasos exactos, que pueden cambiar entre versiones.

## Si algo falla

- **`npm install -g @openai/codex` falla por permisos.** En Mac puede pedir privilegios; usá un gestor de versiones de Node en vez de instalar en el sistema, o seguí la guía del repo de Codex.
- **Los comandos `/codex:...` no aparecen en Claude Code.** El plugin no quedó instalado: corré la instalación desde dentro de `claude` y reabrí la sesión.
- **Codex no ve los mismos archivos que Claude.** Asegurate de que ambos estén lanzados desde la misma carpeta del proyecto.
- **Las revisiones se contradicen.** Es esperable: tomá a Codex como segunda opinión, no como veredicto. Vos decidís.
- **Se te dispara la cuota.** Revisá si dejaste activo algún hook que llama a Codex de forma automática.

## Siguiente nivel

- Sumá `/codex:review` a tu rutina antes de cada commit como chequeo fijo.
- Usá `/codex:rescue` cuando Claude se atore en un bug que no logra cerrar.
- Cuidado con el "Review Gate" (un hook que audita cada respuesta de Claude con Codex): es potente pero, mal usado, puede vaciar tu cuota en horas. Activalo solo cuando lo necesites.
