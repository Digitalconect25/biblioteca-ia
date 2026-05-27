---
titulo: Cursor
nivel: intermedio
categoria: programacion
resumen: Editor de código con IA integrada y un agente de terminal que programa por vos.
descripcion: >
  Cursor es un editor de código (basado en VS Code) con IA integrada: autocompleta, edita y
  refactoriza conversando. Además tiene un agente de terminal (Cursor CLI) que ejecuta
  tareas de código por vos, útil para automatizar o usar en scripts. Funciona en Windows,
  macOS y Linux.
comoUsar: >
  En el editor, escribís en lenguaje natural lo que querés y Cursor propone los cambios. En
  la terminal, lanzás el agente con `agent` y le das instrucciones.
comoAcceder: >
  Descargá el editor desde cursor.com (Windows, macOS y Linux). Tiene plan gratis y planes
  de pago con más uso de IA. Para el agente de terminal, instalalo con los comandos de abajo.
gratis: true
planPago: Planes de pago con más solicitudes de IA y modelos más potentes; hay capa gratuita.
comandos:
  - titulo: "Instalar el editor"
    comun: "Descargar desde https://cursor.com (instalador para Windows, macOS y Linux)"
    nota: "El editor se instala con el instalador gráfico, no por terminal."
  - titulo: "Instalar el agente de terminal (Cursor CLI)"
    windows: "irm 'https://cursor.com/install?win32=true' | iex"
    mac: "curl https://cursor.com/install -fsS | bash"
  - titulo: "Iniciar el agente"
    comun: |
      agent
      agent "refactorizá el módulo de login para usar tokens JWT"
funciones:
  - Autocompletar y editar código con IA
  - Chat sobre tu proyecto dentro del editor
  - Agente de terminal para tareas automatizadas
enlaces:
  - texto: Sitio de Cursor
    url: https://cursor.com
  - texto: Documentación del Cursor CLI
    url: https://cursor.com/docs/cli/overview
tags: [programacion, editor, agente, ide]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Cursor es un editor de código basado en VS Code con IA integrada en todo: autocompleta, edita y refactoriza conversando, y además trae un agente de terminal (Cursor CLI) para tareas automatizadas. Le sirve a quien ya programa en un editor y quiere sumar IA sin cambiar de herramienta, y a quien venía de VS Code y busca una transición sin curva de aprendizaje.

## Cómo empezar, paso a paso

1. Descargá el editor desde [cursor.com](https://cursor.com). Hay instalador gráfico para Windows, macOS y Linux; no se instala por terminal.
2. Abrí tu proyecto en Cursor como lo harías en VS Code. Si tenías extensiones y atajos, podés importarlos.
3. Probá la IA dentro del editor: seleccioná código y pedile cambios en lenguaje natural, o abrí el chat para preguntar sobre tu proyecto.
4. Si querés el agente de terminal, instalalo:

```bash
# Mac / Linux
curl https://cursor.com/install -fsS | bash

# Windows (PowerShell)
irm 'https://cursor.com/install?win32=true' | iex
```

5. Tiene capa gratuita y planes de pago con más solicitudes de IA y modelos más potentes.

## Ejemplo real

Desde la terminal lanzás el agente y le pasás una tarea concreta:

```bash
agent "refactorizá el módulo de login para usar tokens JWT"
```

O lo abrís en modo interactivo para ir conversando:

```bash
agent
```

Dentro del editor, el flujo típico es seleccionar una función, pedir "agregale manejo de errores y comentarios" y revisar el diff que propone antes de aceptarlo.

## Trucos y errores comunes

- El agente de terminal sirve para tareas repetibles o para meterlo en scripts, sin abrir la interfaz gráfica.
- Revisá siempre los cambios propuestos antes de aceptarlos: la IA puede tocar más de lo que esperabas.
- La capa gratuita tiene límites de uso de IA. Si la usás mucho, vas a chocar con ellos rápido.
- Aprovechá que entiende tu proyecto: el chat responde mejor cuando le das contexto del archivo o la carpeta relevante.

## Cuándo conviene

Conviene si querés trabajar en un editor visual con IA en cada paso y no solo en la terminal. Frente a un agente puro de línea de comandos, Cursor te da la comodidad del entorno gráfico de VS Code. El agente de terminal cubre los casos en que necesitás automatizar sin abrir el editor.
