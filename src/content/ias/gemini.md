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

Gemini resuelve dos necesidades distintas con una sola marca. Para cualquiera, es un asistente gratis en la web para escribir, resumir o generar imágenes. Para quien programa, es un agente de terminal de código abierto que automatiza tareas de código. Empezá por la web si recién arrancás y pasá a la CLI cuando quieras meter la IA en tu flujo de trabajo.

## Cómo sacarle el jugo, paso a paso

1. Entrá a gemini.google.com con tu cuenta de Google. No instalás nada y ya podés escribir, pegar texto o pedir imágenes.
2. Dale contexto claro y pedile formato concreto (lista, tabla, cantidad de palabras), igual que a cualquier asistente.
3. Para imágenes, describí estilo, encuadre y proporción. Después pedile ediciones puntuales sobre el resultado.
4. Si programás, probá el CLI sin instalar nada con `npx @google/gemini-cli`. Para usarlo seguido, instalalo global.
5. Al iniciar el CLI, elegí "Login with Google" para la capa gratuita. Sirve para tareas reales sin configurar nada más.
6. Si vas a integrar Gemini en una app propia, conseguí una API key gratis en Google AI Studio y guardala como variable de entorno.

## Ejemplos para copiar

```
Resumí este texto en 5 bullets y después dame un titular
para redes sociales. Tono claro, sin tecnicismos.

[pegás tu texto]
```

```bash
# Pedirle al agente que trabaje sobre tu proyecto desde la terminal
gemini
> Explicá qué hace este repositorio y listá los archivos principales
```

## Trucos y errores comunes

- En la web, podés pedir que busque información actual; aun así, verificá datos sensibles.
- El CLI lee tu carpeta de trabajo: abrilo dentro del proyecto que querés que entienda.
- La capa gratuita del CLI tiene límites de pedidos por minuto y por día; si los volúmenes son altos, revisá la web oficial.
- No confundas la web (chat) con la API (para apps): son accesos distintos con configuraciones distintas.
- Como todo modelo, puede equivocarse; no des por ciertas fechas o cifras sin chequear.

## Cuándo usar esta y cuándo otra

Si ya vivís en el ecosistema de Google o querés generar imágenes sin pagar, Gemini en la web es práctico. Para automatizar tareas de código desde la terminal con una capa gratuita generosa, el Gemini CLI compite con Claude Code. Para respuestas con fuentes citadas, Perplexity sigue siendo más directo.
