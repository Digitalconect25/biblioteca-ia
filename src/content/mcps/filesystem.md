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

Útil cuando querés que el agente trabaje con tus archivos locales, pero solo dentro de las
carpetas que elegís. **Seguridad:** dale acceso únicamente a carpetas con las que estés
cómodo; el servidor opera con tus permisos de usuario.
