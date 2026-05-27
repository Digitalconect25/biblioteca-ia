---
titulo: Desktop Commander (MCP)
nivel: avanzado
resumen: "Servidor MCP que le da al agente control de tu escritorio: archivos, terminal y procesos."
descripcion: >
  Desktop Commander es un MCP que permite a Claude ejecutar comandos en tu terminal, manejar
  archivos y procesos, y automatizar tareas en tu computadora, con tu permiso. Es uno de los
  MCP más potentes para trabajo local, justamente por eso conviene usarlo con cuidado.
comoConectar: >
  Se agrega con el comando de Claude Code (claude mcp add). Una vez conectado, el agente puede
  proponerte ejecutar comandos y trabajar con archivos. Revisá cada acción antes de aprobar.
funciones:
  - Ejecutar comandos en la terminal
  - Leer, escribir y mover archivos
  - Manejar procesos y tareas del sistema
comandos:
  - titulo: "Agregar el MCP (Claude Code)"
    comun: "claude mcp add desktop-commander -- npx -y @wonderwhy-er/desktop-commander"
  - titulo: "Verificar que quedó conectado"
    comun: "claude mcp list"
enlaces:
  - texto: "wonderwhy-er/DesktopCommanderMCP (repo)"
    url: https://github.com/wonderwhy-er/DesktopCommanderMCP
tags: [mcp, terminal, archivos, automatizacion]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Desktop Commander le da al agente control real de tu computadora: ejecutar comandos en la terminal, leer y escribir archivos, mover cosas y manejar procesos del sistema. Es de los MCP más potentes para trabajo local, y justamente por eso es de los que más cuidado piden. Con esto el agente puede operar tu máquina casi como lo harías vos desde una consola.

## Cómo conectarlo, paso a paso

1. Verificá que tenés Node.js (`node --version`); el servidor corre con `npx`.

2. Agregalo con el comando de Claude Code:

```
claude mcp add desktop-commander -- npx -y @wonderwhy-er/desktop-commander
```

3. Confirmá que quedó conectado:

```
claude mcp list
```

Tendría que aparecer `desktop-commander` en la lista. El comando es el mismo en Windows y en Mac; lo que cambia, una vez en uso, son las rutas y los comandos de terminal propios de cada sistema (por ejemplo `dir` en Windows contra `ls` en Mac).

## Ejemplo real

Una vez conectado, le pedís tareas que combinan archivos y terminal:

```
En la carpeta de mi proyecto, instalá las dependencias, corré los tests y mostrame qué falló.
```

El agente te propone los comandos y vos los aprobás uno por uno antes de que se ejecuten.

## Seguridad y errores comunes

- Es el MCP más sensible de esta lista: revisá cada comando antes de aprobarlo, sobre todo borrados, sobrescrituras o cualquier cosa que toque archivos del sistema.
- No lo uses en máquinas con datos críticos o de producción sin entender exactamente qué hace cada paso.
- Si una tarea pide credenciales o claves, usá un placeholder como TU_API_KEY y nunca dejes secretos en comandos que queden en el historial.
- Si no aparece en `claude mcp list`, revisá que Node.js esté instalado y volvé a correr el `add`.

## Cuándo conviene

Cuando querés que el agente automatice tareas de tu sistema: correr scripts, instalar dependencias, ordenar archivos en lote o encadenar comandos. Ideal para usuarios técnicos que entienden los comandos que van a aprobar.
