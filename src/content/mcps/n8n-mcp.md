---
titulo: n8n MCP
nivel: avanzado
resumen: Servidor MCP para crear y manejar automatizaciones de n8n desde tu agente de IA.
descripcion: >
  n8n es una herramienta de automatización de flujos de trabajo (como Zapier o Make, pero de
  código abierto). Este MCP conecta a Claude con n8n para diseñar, configurar y validar
  workflows conversando, en vez de armar cada nodo a mano.
comoConectar: >
  Se agrega con el comando de Claude Code. Una vez conectado, podés pedirle a Claude que arme
  o ajuste automatizaciones de n8n.
funciones:
  - Crear y editar workflows de n8n
  - Configurar y validar nodos
  - Ayuda con expresiones y patrones de automatización
comandos:
  - titulo: "Agregar el MCP (Claude Code)"
    comun: "claude mcp add --transport stdio n8n-mcp -- npx n8n-mcp@latest"
enlaces:
  - texto: "czlonkowski/n8n-mcp (repo)"
    url: https://github.com/czlonkowski/n8n-mcp
  - texto: "n8n (sitio)"
    url: https://n8n.io
tags: [mcp, automatizacion, n8n, workflows]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

n8n es una herramienta de automatización de flujos de trabajo, de código abierto, parecida a Zapier o Make pero que podés alojar vos. Este MCP conecta a Claude con n8n para que diseñes, configures y valides workflows conversando, en vez de arrastrar y configurar cada nodo a mano. En la práctica, "armar un workflow" pasa a ser una charla con el agente, que conoce los nodos, las expresiones y los patrones comunes de automatización.

## Cómo conectarlo, paso a paso

1. Verificá que tenés Node.js (`node --version`); el servidor corre con `npx`.

2. Agregalo con el comando de Claude Code, usando el transporte stdio:

```
claude mcp add --transport stdio n8n-mcp -- npx n8n-mcp@latest
```

El comando es igual en Windows y en Mac.

3. Confirmá que quedó conectado:

```
claude mcp list
```

Tendría que aparecer `n8n-mcp`. A partir de ahí podés pedirle a Claude que arme o ajuste automatizaciones.

## Ejemplo real

Con el MCP conectado, describís la automatización que querés:

```
Armame un workflow de n8n que, cuando llegue un formulario nuevo, guarde los datos en una planilla y mande un mail de aviso. Mostrame los nodos y validá la configuración.
```

## Seguridad y errores comunes

- El MCP te ayuda a diseñar y validar el workflow, pero las credenciales de cada servicio (mail, planillas, APIs) se cargan en n8n, no en el chat. Usá un placeholder como TU_API_KEY si necesitás referirte a una clave.
- Revisá los workflows antes de activarlos, sobre todo si mandan mails, escriben en bases de datos o llaman APIs externas.
- Si el MCP no aparece en `claude mcp list`, revisá que Node.js esté instalado y volvé a correr el `add`.
- Validá los nodos antes de poner el flujo en producción: un nodo mal configurado puede disparar acciones repetidas.

## Cuándo conviene

Cuando ya automatizás con n8n o querés empezar, y preferís describir lo que necesitás en lenguaje natural en lugar de armar cada nodo a mano. Ideal para conectar apps y mover datos entre servicios sin programar cada paso.
