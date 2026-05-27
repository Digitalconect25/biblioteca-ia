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

GitHub Copilot escribe y sugiere código mientras programás. Vive dentro de editores como VS Code, Visual Studio y JetBrains, y suma una CLI (Copilot CLI) que funciona como agente en la terminal. Le sirve sobre todo a quien ya trabaja con repos en GitHub: la integración con su ecosistema es la más directa.

## Cómo empezar, paso a paso

1. Necesitás una cuenta de GitHub. Hay un plan gratuito con límites y planes de pago (Pro, Business, Enterprise) con más capacidad.
2. Para el editor, instalá la extensión de Copilot desde el marketplace de tu editor (VS Code, Visual Studio o JetBrains).
3. Para la terminal, instalá el Copilot CLI. En Windows el CLI requiere PowerShell 6 o superior:

```bash
# Mac
brew install copilot-cli

# Windows
winget install GitHub.Copilot

# Cualquier SO (con Node)
npm install -g @github/copilot
```

4. Iniciá el CLI y, si es la primera vez, autenticate:

```bash
copilot
# dentro del CLI, si no estás logueado:
/login
```

## Ejemplo real

En el editor, Copilot autocompleta mientras escribís: empezás a tipear una función y te sugiere el cuerpo completo, que aceptás con Tab. También respondés preguntas en el chat lateral.

En la terminal, le pasás una tarea al agente:

```text
> Creá un script que renombre todos los .jpeg de esta carpeta a .jpg
```

El agente propone los comandos y te pide permiso antes de ejecutarlos.

## Trucos y errores comunes

- En Windows, si el CLI no arranca, verificá que tengas PowerShell 6 o superior. La versión vieja no alcanza.
- El plan gratuito tiene límites de completados y mensajes de chat por mes. Si los superás, las sugerencias se cortan hasta el ciclo siguiente.
- Las sugerencias del editor son eso: sugerencias. Leelas antes de aceptar, no todo lo que propone es correcto.
- El chat responde mejor cuando tenés el archivo relevante abierto, porque usa ese contexto.

## Cuándo conviene

Conviene si tu trabajo gira alrededor de GitHub y querés autocompletado fluido dentro del editor. Frente a agentes que viven solo en la terminal, Copilot brilla en el editor; su CLI cubre las tareas de línea de comandos cuando las necesitás.
