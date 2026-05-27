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

Claude Code convierte tareas de programación en una conversación. Ideal cuando querés
construir o arreglar software sin escribir cada línea a mano. En Windows conviene instalar
también [Git for Windows](https://git-scm.com/downloads/win) para que pueda usar Bash.
