---
titulo: Gemini
nivel: principiante
resumen: La IA de Google. Se usa en la web, y también tiene una CLI gratuita y de código abierto.
descripcion: >
  Gemini es el asistente de IA de Google. Lo usás gratis en la web (gemini.google.com) para
  escribir, resumir, razonar y generar imágenes. Para quien programa, existe el Gemini CLI:
  un agente de código abierto que corre en tu terminal, con una capa gratuita generosa
  (login con tu cuenta de Google: 60 pedidos/min y 1.000/día).
comoAcceder: >
  Web: entrá a gemini.google.com con tu cuenta de Google (gratis). CLI: instalala según tu
  sistema con los comandos de abajo. Para la API necesitás una clave gratis desde
  Google AI Studio (aistudio.google.com/apikey).
gratis: true
planPago: Planes pagos (Google AI Pro/Ultra) con modelos más potentes y más límites; la web y la capa gratis de la CLI no cuestan.
funciones:
  - Conversar, escribir y resumir
  - Generar y editar imágenes
  - Agente de programación en la terminal (Gemini CLI)
  - Acceso por API para tus propias apps
casosDeUso:
  - Redactar o resumir sin instalar nada (web)
  - Automatizar tareas de código desde la terminal (CLI)
  - Integrar Gemini en una app propia (API)
comandos:
  - titulo: "Probar el Gemini CLI sin instalar (Node 18+)"
    comun: "npx @google/gemini-cli"
  - titulo: "Instalar el Gemini CLI (cualquier SO, Node 18+)"
    comun: "npm install -g @google/gemini-cli"
  - titulo: "Instalar en macOS con Homebrew"
    mac: "brew install gemini-cli"
  - titulo: "Iniciar y autenticar (login con Google, gratis)"
    comun: "gemini"
    nota: "Al iniciar, elegí 'Login with Google' para la capa gratuita (60/min, 1.000/día)."
  - titulo: "Usar con una API key (opcional)"
    windows: "$env:GEMINI_API_KEY=\"TU_API_KEY\"; gemini"
    mac: "export GEMINI_API_KEY=\"TU_API_KEY\"\ngemini"
    nota: "La key se obtiene gratis en aistudio.google.com/apikey. En Windows el comando es para PowerShell."
enlaces:
  - texto: Gemini (web)
    url: https://gemini.google.com
  - texto: Gemini CLI (repositorio)
    url: https://github.com/google-gemini/gemini-cli
  - texto: Documentación del Gemini CLI
    url: https://www.geminicli.com/docs/get-started/installation
  - texto: Obtener API key (Google AI Studio)
    url: https://aistudio.google.com/apikey
tags: [chatbot, google, generativa, cli, programacion]
actualizado: 2026-05-27
revisarAntesDe: 2026-08-27
---

Gemini cubre dos públicos con una sola marca: cualquiera lo usa gratis en la web, y quien
programa tiene un agente de terminal de código abierto con capa gratuita. Empezá por la web
si recién arrancás; pasá a la CLI cuando quieras automatizar.
