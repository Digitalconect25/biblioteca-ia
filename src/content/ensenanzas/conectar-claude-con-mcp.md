---
titulo: Conectar Claude a tus herramientas con MCP
nivel: avanzado
herramienta: Claude Desktop + MCP
tiempo: 25 min
resumen: Dale a Claude acceso a tus archivos (y más) con MCP para que automatice tareas reales.
descripcion: >
  MCP (Model Context Protocol) es el estándar que conecta a Claude con herramientas externas:
  tu sistema de archivos, GitHub, bases de datos y cientos de servidores más. Acá conectás el
  servidor de archivos a Claude Desktop para que pueda leer y organizar tus carpetas, con permiso.
objetivo: Que Claude pueda trabajar con tus archivos locales de forma automática y segura.
requisitos:
  - Claude Desktop instalado (claude.ai/download)
  - Node.js instalado (nodejs.org, versión LTS)
  - Saber tu nombre de usuario del sistema
pasos:
  - titulo: "1. Verificar que tenés Node.js"
    detalle: "Los servidores MCP suelen necesitar Node. Si no devuelve una versión, instalalo desde nodejs.org."
    comun: "node --version"
  - titulo: "2. Abrir el archivo de configuración"
    detalle: "En Claude Desktop: Configuración → pestaña Developer → 'Edit Config'. O abrí directamente el archivo en esta ruta según tu sistema."
    windows: "%APPDATA%\\Claude\\claude_desktop_config.json"
    mac: "~/Library/Application Support/Claude/claude_desktop_config.json"
  - titulo: "3. Agregar el servidor de archivos"
    detalle: "Pegá esta configuración (reemplazá 'usuario' por tu nombre real). Las rutas son las carpetas que Claude podrá tocar."
    windows: |
      {
        "mcpServers": {
          "filesystem": {
            "command": "npx",
            "args": ["-y", "@modelcontextprotocol/server-filesystem",
              "C:\\Users\\usuario\\Desktop", "C:\\Users\\usuario\\Downloads"]
          }
        }
      }
    mac: |
      {
        "mcpServers": {
          "filesystem": {
            "command": "npx",
            "args": ["-y", "@modelcontextprotocol/server-filesystem",
              "/Users/usuario/Desktop", "/Users/usuario/Downloads"]
          }
        }
      }
  - titulo: "4. Reiniciar Claude Desktop por completo"
    detalle: "Cerralo del todo y volvé a abrirlo. Aparece un indicador de MCP en la caja de mensajes si cargó bien."
  - titulo: "5. Probarlo"
    detalle: "Pedile algo que use los archivos. Claude pedirá permiso antes de cada acción."
    comun: '¿Qué archivos hay en mi carpeta Downloads? Organizá las imágenes en una subcarpeta llamada Imágenes.'
enlaces:
  - texto: "Guía oficial (conectar servidores MCP)"
    url: https://modelcontextprotocol.io/quickstart/user
  - texto: "modelcontextprotocol/servers (servidores oficiales, 86k⭐)"
    url: https://github.com/modelcontextprotocol/servers
tags: [automatizacion, mcp, claude, herramientas]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Al terminar, Claude Desktop va a poder leer y organizar tus archivos locales sin que tengas que arrastrarlos al chat ni describir su contenido a mano. Es el primer paso para que Claude deje de ser un asistente que solo conversa y pase a ser uno que toca tus herramientas de verdad.

## Qué tener en cuenta

MCP es un estándar abierto: el mismo patrón que usás para el servidor de archivos te sirve para GitHub, bases de datos o búsqueda web. Lo importante es entender que cada servidor que agregás le da a Claude una capacidad nueva y un alcance nuevo.

El archivo de configuración es JSON estricto: una coma de más o una llave sin cerrar y Claude Desktop no carga el servidor. Las rutas que ponés en `args` son las únicas carpetas que Claude va a poder ver y modificar; dale acceso solo a carpetas con las que estés cómodo, y nunca a la raíz de tu disco. La primera vez que usa `npx`, descarga el servidor, así que puede tardar unos segundos más de lo esperado.

## Si algo falla

- **`node --version` no devuelve nada.** No tenés Node instalado o no está en el PATH. Instalá la versión LTS desde nodejs.org y reabrí la terminal.
- **No aparece el indicador de MCP tras reiniciar.** Cerrá Claude Desktop por completo (en Mac, también desde el menú de la barra superior, no solo la ventana) y volvé a abrirlo. Cerrar la ventana no alcanza.
- **El JSON da error.** Pegá el contenido en un validador de JSON o pedile a Claude que lo revise. Lo más común son comas finales o comillas mal copiadas.
- **Claude no encuentra tus archivos.** Verificá que reemplazaste `usuario` por tu nombre real y que la ruta existe tal cual está escrita, respetando mayúsculas.
- **Pide permiso una y otra vez.** Es lo esperado: MCP confirma cada acción sensible. Leé qué va a hacer y aprobá; no es un error.

## Siguiente nivel

- Sumá el servidor de GitHub para que Claude lea y comente tus repos desde el mismo config.
- Agregá un MCP de búsqueda web para que combine tus archivos con información actualizada.
- Una vez cómodo con el patrón en Claude Desktop, llevá los mismos MCPs a Claude Code (ver la enseñanza de equipar Claude Code).
