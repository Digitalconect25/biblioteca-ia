---
titulo: Claude Code
nivel: intermedio
categoria: programacion
resumen: "Agente de IA de Anthropic que programa en tu terminal: lee tu proyecto, edita archivos y corre comandos."
descripcion: >
  Claude Code es una herramienta de línea de comandos donde Claude trabaja como un
  programador: lee tu proyecto, edita archivos, ejecuta comandos y construye software
  conversando en lenguaje natural. Es la base sobre la que corren skills y MCPs.
  Funciona en macOS 13+, Windows 10 (1809+) y Linux; también hay app de escritorio y
  extensiones para VS Code y JetBrains.
comoUsar: >
  Abrís una terminal en la carpeta de tu proyecto, ejecutás `claude` y le hablás en
  lenguaje natural ("agregá una página de contacto", "arreglá este error"). Claude propone
  y aplica los cambios, pidiéndote permiso para las acciones sensibles.
comoAcceder: >
  Requiere una cuenta de pago de Anthropic (Pro, Max, Team o Enterprise). El plan gratis
  de Claude.ai NO incluye Claude Code. Elegí UNO de los métodos de instalación de abajo
  según tu sistema.
gratis: false
planPago: Incluido en los planes Pro, Max, Team o Enterprise de Anthropic (no en el plan gratis).
comandos:
  - titulo: "Instalar (recomendado, instalador nativo)"
    windows: "irm https://claude.ai/install.ps1 | iex"
    mac: "curl -fsSL https://claude.ai/install.sh | bash"
    nota: "En Windows, ese comando es para PowerShell. El instalador nativo se actualiza solo."
  - titulo: "Instalar con gestor de paquetes"
    windows: "winget install Anthropic.ClaudeCode"
    mac: "brew install --cask claude-code"
    nota: "Estas instalaciones NO se autoactualizan: actualizá con 'winget upgrade Anthropic.ClaudeCode' o 'brew upgrade claude-code'."
  - titulo: "Instalar con npm (cualquier SO, requiere Node 18+)"
    comun: "npm install -g @anthropic-ai/claude-code"
    nota: "No uses 'sudo npm install -g' (puede causar problemas de permisos)."
  - titulo: "Verificar e iniciar"
    comun: |
      claude --version
      claude doctor
      claude
funciones:
  - Leer y entender todo tu proyecto
  - Editar archivos y aplicar cambios con tu permiso
  - Ejecutar comandos en la terminal
  - Correr skills y conectarse a MCPs
enlaces:
  - texto: Guía de instalación oficial
    url: https://code.claude.com/docs/en/setup
  - texto: Sitio de Claude Code
    url: https://claude.com/claude-code
tags: [programacion, agente, terminal, anthropic, cli]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Claude Code convierte tareas de programación en una conversación dentro de tu terminal. En vez de escribir cada línea, le explicás qué querés lograr y el agente lee tu proyecto, propone cambios, edita archivos y corre comandos. Le sirve a quien programa todos los días y quiere acelerar, pero también a quien sabe poco de código y necesita una mano que entienda el contexto completo del repositorio.

## Cómo empezar, paso a paso

1. Necesitás una cuenta paga de Anthropic (Pro, Max, Team o Enterprise). El plan gratis de Claude.ai no incluye Claude Code.
2. Instalá con el método que prefieras. El instalador nativo se actualiza solo:

```bash
# Mac / Linux
curl -fsSL https://claude.ai/install.sh | bash

# Windows (PowerShell)
irm https://claude.ai/install.ps1 | iex
```

3. Si preferís gestor de paquetes: `brew install --cask claude-code` en Mac o `winget install Anthropic.ClaudeCode` en Windows. Estas versiones no se autoactualizan, así que cada tanto corré `brew upgrade claude-code` o `winget upgrade Anthropic.ClaudeCode`.
4. En Windows instalá también [Git for Windows](https://git-scm.com/downloads/win) para que Claude pueda usar Bash.
5. Verificá que quedó bien y arrancá:

```bash
claude --version
claude doctor
claude
```

## Ejemplo real

Abrís la terminal en la carpeta de tu proyecto, escribís `claude` y le pedís algo concreto:

```text
> Agregá una página de contacto con un formulario de nombre, email y mensaje.
  Usá el mismo estilo que la página de inicio.
```

Claude lee tu estructura de archivos, te muestra el código que va a crear y te pide permiso antes de tocar nada. Después podés seguir la conversación: `corré los tests` o `el formulario no valida el email, arreglalo`.

## Trucos y errores comunes

- No uses `sudo npm install -g` para instalar: suele romper permisos. Usá el instalador nativo o el gestor de paquetes.
- Si algo falla al iniciar, corré `claude doctor`: te diagnostica problemas de instalación y configuración.
- Trabajá siempre dentro de un repo con control de versiones (git). Así revisás los cambios con `git diff` antes de aceptarlos.
- Pedile cambios chicos y revisables en vez de tareas enormes de una sola vez. Es más fácil de controlar.

## Cuándo conviene

Conviene cuando querés que la IA trabaje sobre tu proyecto entero, no solo sobre el archivo abierto. Frente a un editor con autocompletado, Claude Code es mejor para tareas que cruzan varios archivos o que mezclan código y comandos de terminal. Es además la base sobre la que corren las skills y los MCPs.
