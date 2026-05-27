---
titulo: ¿Qué es un MCP?
nivel: intermedio
resumen: El "enchufe estándar" que conecta agentes de IA con herramientas y datos externos.
descripcion: >
  MCP (Model Context Protocol) es un protocolo abierto que estandariza cómo un agente de
  IA se conecta con herramientas, archivos y servicios externos. En vez de integraciones a
  medida para cada cosa, un servidor MCP expone funciones que el agente puede usar (siempre
  con tu permiso). Lo soportan Claude Desktop, Claude Code y muchos otros clientes.
comoConectar: >
  En Claude Desktop: abrí Configuración → pestaña Developer → "Edit Config". Eso abre (o
  crea) el archivo claude_desktop_config.json. Agregás el servidor MCP ahí y reiniciás
  Claude Desktop por completo. La ubicación del archivo cambia según el sistema (ver
  comandos). Necesitás Node.js instalado para la mayoría de los servidores.
funciones:
  - Exponer herramientas externas al agente de forma estándar
  - Dar acceso a datos (archivos, bases de datos, APIs)
  - Reutilizar la misma integración en distintos agentes
comandos:
  - titulo: "Dónde está el archivo de configuración (Claude Desktop)"
    windows: "%APPDATA%\\Claude\\claude_desktop_config.json"
    mac: "~/Library/Application Support/Claude/claude_desktop_config.json"
    nota: "Si el archivo no existe, Claude Desktop lo crea al tocar 'Edit Config' en la pestaña Developer."
  - titulo: "Verificar que tenés Node.js"
    comun: "node --version"
    nota: "Si no lo tenés, instalalo desde nodejs.org (versión LTS recomendada)."
ejemploConfig: |
  {
    "mcpServers": {
      "mi-servidor": {
        "command": "npx",
        "args": ["-y", "@ejemplo/servidor-mcp"]
      }
    }
  }
enlaces:
  - texto: Guía oficial (conectar servidores MCP)
    url: https://modelcontextprotocol.io/quickstart/user
  - texto: Especificación de MCP
    url: https://modelcontextprotocol.io
  - texto: Servidores MCP oficiales
    url: https://github.com/modelcontextprotocol/servers
tags: [mcp, integraciones, protocolo, agentes]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

MCP es a los agentes de IA lo que el USB-C fue a los dispositivos: antes cada aparato traía su propio cable y su propio enchufe, y conectar algo nuevo era una pelea. El USB-C puso un solo conector que sirve para todo. MCP hace lo mismo con los agentes: en vez de programar una integración a medida para cada servicio (tu disco, GitHub, una base de datos, un sitio web), define un estándar para que el agente "enchufe" cualquier herramienta que exponga un servidor MCP. Vos seguís teniendo el control: el agente solo puede usar lo que vos autorizás, y cada acción te pide permiso.

## Cómo encaja en el ecosistema

Hay tres piezas que conviene distinguir:

- **El modelo** (Claude, por ejemplo) razona y decide qué hacer.
- **El cliente MCP** (Claude Desktop, Claude Code, VS Code y otros) es el programa donde vos trabajás y que le habla a los servidores.
- **El servidor MCP** es el "enchufe" de cada herramienta: uno para archivos, otro para GitHub, otro para la web. Cada servidor expone funciones que el agente puede llamar.

La gracia es que un mismo servidor sirve para cualquier cliente compatible. Escribís la integración una vez y la reusás en todos lados.

## Cómo conectar un servidor, paso a paso

1. Verificá que tenés Node.js, que la mayoría de los servidores necesitan:

```
node --version
```

Si no lo tenés, instalalo desde nodejs.org (versión LTS).

2. En Claude Desktop, abrí Configuración, andá a la pestaña Developer y tocá "Edit Config". Eso abre (o crea) el archivo `claude_desktop_config.json`. La ubicación cambia según el sistema:

```
Windows: %APPDATA%\Claude\claude_desktop_config.json
Mac:     ~/Library/Application Support/Claude/claude_desktop_config.json
```

3. Agregá el servidor dentro de `mcpServers`:

```
{
  "mcpServers": {
    "mi-servidor": {
      "command": "npx",
      "args": ["-y", "@ejemplo/servidor-mcp"]
    }
  }
}
```

4. Guardá y reiniciá Claude Desktop por completo (cerralo del todo, no solo la ventana). Recién ahí carga el servidor.

## Ejemplo real

Con un servidor conectado, le hablás al agente en lenguaje natural y él decide cuándo usar las funciones que el servidor expone:

```
Revisá la carpeta de mi proyecto, decime qué archivos hay y resumime el README.
```

## Seguridad y errores comunes

- El agente nunca actúa solo: vos aprobás cada acción. Aun así, dale acceso únicamente a lo que necesite.
- Si el servidor no aparece, casi siempre es porque no reiniciaste Claude Desktop del todo.
- Errores típicos de JSON: una coma de más o una llave sin cerrar rompen toda la config.
- Si una herramienta pide una clave, usá un placeholder como TU_API_KEY mientras pruebas y nunca subas la clave real a un repositorio.

## Cuándo conviene

Cuando querés que el agente deje de estar "encerrado" en su conocimiento y pueda trabajar con tus datos y herramientas reales: leer tus archivos, mover datos, consultar APIs o automatizar tareas. Es la base de todo lo que sigue en esta biblioteca.
