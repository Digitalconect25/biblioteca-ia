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

Seguridad primero: dale acceso solo a carpetas con las que estés cómodo. Una vez que entendés
el patrón, podés sumar otros MCP (GitHub, búsqueda web, bases de datos) de la misma forma.
