---
titulo: GitHub Copilot
nivel: intermedio
categoria: programacion
resumen: El asistente de programación de GitHub, en tu editor y en la terminal.
descripcion: >
  GitHub Copilot sugiere y escribe código mientras programás. Vive dentro de editores como
  VS Code, Visual Studio y JetBrains, y también tiene una CLI (Copilot CLI) que funciona
  como agente en la terminal: le pedís tareas y las ejecuta con tu permiso.
comoUsar: >
  En el editor, Copilot autocompleta y responde en un chat lateral. En la terminal, lanzás
  `copilot` y le das instrucciones; la primera vez te autenticás con `/login`.
comoAcceder: >
  Necesitás una cuenta de GitHub. Hay un plan gratuito con límites y planes de pago con más
  capacidad. Para el editor, instalá la extensión de Copilot; para la terminal, usá los
  comandos de abajo (requiere PowerShell 6+ en Windows).
gratis: true
planPago: Planes Copilot de pago (Pro, Business, Enterprise) con más uso; existe un plan gratuito con límites.
comandos:
  - titulo: "Instalar el Copilot CLI con gestor de paquetes"
    windows: "winget install GitHub.Copilot"
    mac: "brew install copilot-cli"
  - titulo: "Instalar el Copilot CLI con npm (cualquier SO)"
    comun: "npm install -g @github/copilot"
  - titulo: "Iniciar y autenticar"
    comun: |
      copilot
      # dentro del CLI, si no estás logueado:
      /login
funciones:
  - Autocompletar código en el editor
  - Chat de programación integrado
  - Agente de terminal (Copilot CLI)
enlaces:
  - texto: GitHub Copilot (sitio)
    url: https://github.com/features/copilot
  - texto: Sobre el Copilot CLI
    url: https://docs.github.com/copilot/concepts/agents/about-copilot-cli
tags: [programacion, github, agente, cli, editor]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Copilot es el más integrado al mundo GitHub: si ya trabajás con repos ahí, su CLI y sus
extensiones encajan sin fricción.
