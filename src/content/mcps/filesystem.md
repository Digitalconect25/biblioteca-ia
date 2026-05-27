---
titulo: MCP de sistema de archivos
nivel: intermedio
resumen: Un servidor MCP que le da al agente acceso controlado a leer y escribir archivos.
descripcion: >
  El servidor MCP de filesystem permite que un agente lea, escriba y navegue archivos en
  las carpetas que vos autorizás. Es uno de los MCPs más útiles para trabajar con proyectos
  locales de forma segura: solo accede a las rutas que listás, y cada acción pide tu permiso.
comoConectar: >
  Agregá el servidor a claude_desktop_config.json indicando las carpetas permitidas, y
  reiniciá Claude Desktop. La diferencia clave entre Windows y Mac es el formato de las
  rutas (ver comandos). Reemplazá "usuario" por tu nombre de usuario real.
funciones:
  - Leer y escribir archivos en carpetas autorizadas
  - Listar y buscar dentro de directorios
  - Mover y renombrar archivos
  - Limitar el acceso a rutas específicas (seguridad)
comandos:
  - titulo: "Configuración (pegar en claude_desktop_config.json)"
    windows: |
      {
        "mcpServers": {
          "filesystem": {
            "command": "npx",
            "args": [
              "-y",
              "@modelcontextprotocol/server-filesystem",
              "C:\\Users\\usuario\\Desktop",
              "C:\\Users\\usuario\\Downloads"
            ]
          }
        }
      }
    mac: |
      {
        "mcpServers": {
          "filesystem": {
            "command": "npx",
            "args": [
              "-y",
              "@modelcontextprotocol/server-filesystem",
              "/Users/usuario/Desktop",
              "/Users/usuario/Downloads"
            ]
          }
        }
      }
    nota: "En Windows las rutas usan barra invertida doble (\\\\); en Mac, barra normal (/)."
  - titulo: "Probar el servidor a mano (para depurar)"
    windows: "npx -y @modelcontextprotocol/server-filesystem C:\\Users\\usuario\\Desktop"
    mac: "npx -y @modelcontextprotocol/server-filesystem /Users/usuario/Desktop"
    nota: "Si esto corre sin errores, la config debería funcionar tras reiniciar Claude Desktop."
enlaces:
  - texto: Guía oficial (filesystem MCP)
    url: https://modelcontextprotocol.io/quickstart/user
  - texto: Servidores MCP oficiales
    url: https://github.com/modelcontextprotocol/servers
tags: [mcp, archivos, local]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

El MCP de filesystem le da al agente acceso controlado a tus archivos: puede leer, escribir, listar, buscar, mover y renombrar, pero solo dentro de las carpetas que vos listás explícitamente. Es de los servidores más útiles para trabajar con proyectos locales porque convierte al agente en alguien que entiende tu carpeta de trabajo, sin dejarlo suelto por todo el disco.

## Cómo conectarlo, paso a paso

1. Verificá que tenés Node.js (`node --version`); el servidor corre con `npx`.

2. Abrí `claude_desktop_config.json` desde la pestaña Developer de Claude Desktop. Agregá el servidor listando las carpetas permitidas. Reemplazá `usuario` por tu nombre de usuario real.

En Mac las rutas usan barra normal:

```
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/usuario/Desktop",
        "/Users/usuario/Downloads"
      ]
    }
  }
}
```

En Windows las rutas usan barra invertida doble (`\\`):

```
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:\\Users\\usuario\\Desktop",
        "C:\\Users\\usuario\\Downloads"
      ]
    }
  }
}
```

3. Guardá y reiniciá Claude Desktop por completo.

4. Si algo falla, probá el servidor a mano en una terminal para ver el error:

```
npx -y @modelcontextprotocol/server-filesystem /Users/usuario/Desktop
```

(en Windows, con la ruta `C:\Users\usuario\Desktop`). Si corre sin errores, la config debería andar tras reiniciar.

## Ejemplo real

Una vez conectado, le pedís que trabaje con tus carpetas:

```
Mirá la carpeta Downloads, agrupá los PDF por tema y armame una lista con un resumen de cada uno.
```

## Seguridad y errores comunes

- El servidor opera con tus permisos de usuario: dale acceso solo a carpetas con las que estés cómodo, nunca a la raíz del disco ni a carpetas del sistema.
- Cada acción de escritura te pide permiso; revisá antes de aprobar borrados o sobrescrituras.
- En Windows, si las rutas usan una sola barra invertida la config falla: tienen que ir dobles.
- Si el servidor no aparece tras editar la config, casi siempre es porque no reiniciaste Claude Desktop del todo.

## Cuándo conviene

Cuando querés que el agente lea y organice archivos locales, ordene carpetas, busque algo entre muchos documentos o edite archivos de un proyecto, manteniendo el acceso acotado a unas pocas rutas elegidas.
