---
titulo: MCP de GitHub
nivel: avanzado
resumen: Servidor MCP oficial de GitHub para que el agente trabaje con repos, issues y PRs.
descripcion: >
  El servidor MCP de GitHub conecta tu agente de IA con tu cuenta de GitHub: leer y crear
  issues, revisar y abrir Pull Requests, navegar repositorios y más, siempre con tu permiso.
  Hay dos formas de usarlo: la remota (alojada por GitHub, recomendada) y la local con Docker.
comoConectar: >
  Opción recomendada: la versión remota (hosted) que GitHub aloja, con login por OAuth.
  Opción local: corrés el servidor con Docker usando un token personal (PAT). En ambos casos
  agregás la configuración a tu cliente MCP (Claude, VS Code, etc.). El PAT se crea en
  github.com/settings/personal-access-tokens/new con los permisos que necesites (ej. repo).
funciones:
  - Leer y crear issues
  - Revisar y abrir Pull Requests
  - Navegar repositorios y código
  - Buscar en GitHub desde el agente
comandos:
  - titulo: "Opción remota (hosted, recomendada) — OAuth"
    comun: |
      {
        "servers": {
          "github": {
            "type": "http",
            "url": "https://api.githubcopilot.com/mcp/"
          }
        }
      }
    nota: "Requiere un cliente compatible (ej. VS Code 1.101+). El login es por OAuth, sin token."
  - titulo: "Opción local con Docker (usa un token PAT)"
    comun: |
      {
        "mcpServers": {
          "github": {
            "command": "docker",
            "args": ["run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"],
            "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "TU_TOKEN" }
          }
        }
      }
    nota: "Necesitás Docker instalado. Reemplazá TU_TOKEN por tu PAT (no lo compartas)."
enlaces:
  - texto: Repositorio oficial (GitHub MCP server)
    url: https://github.com/github/github-mcp-server
  - texto: Crear un token (PAT)
    url: https://github.com/settings/personal-access-tokens/new
tags: [mcp, github, repos, automatizacion]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

El MCP de GitHub conecta tu agente con tu cuenta: leer y crear issues, revisar y abrir Pull Requests, navegar repositorios y buscar código, siempre con tu permiso. El agente deja de estar "ciego" a tu GitHub y pasa a poder hacer el trabajo repetitivo de gestión de un repo por vos. Hay dos formas de usarlo y conviene empezar por la remota.

## Cómo conectarlo, paso a paso

**Opción remota (hosted, recomendada).** GitHub aloja el servidor y el login es por OAuth, así que no manejás tokens. Necesitás un cliente compatible (por ejemplo VS Code 1.101 o superior). Agregás esto a la config del cliente:

```
{
  "servers": {
    "github": {
      "type": "http",
      "url": "https://api.githubcopilot.com/mcp/"
    }
  }
}
```

Al conectarte, el cliente te abre el flujo de OAuth y autorizás el acceso desde el navegador.

**Opción local con Docker.** Si preferís correrlo en tu máquina, necesitás Docker instalado y un token personal (PAT). Creá el PAT en github.com/settings/personal-access-tokens/new con los permisos mínimos que necesites (por ejemplo, `repo`). Después agregás:

```
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "TU_API_KEY" }
    }
  }
}
```

Reemplazá TU_API_KEY por tu PAT. En ambos casos, reiniciá el cliente para que cargue el servidor.

## Ejemplo real

Con el MCP conectado, le pedís tareas sobre tus repos en lenguaje natural:

```
En mi repo biblioteca-ia, abrí un issue que describa el bug del formulario de contacto y etiquetalo como "bug".
```

## Seguridad y errores comunes

- Preferí la opción remota: al usar OAuth no hay token que se te filtre.
- Si usás PAT, dale los permisos mínimos y nunca lo pegues en lugares públicos ni lo subas a un repo. Si se expone, revocalo y generá uno nuevo.
- Para la opción local, Docker tiene que estar corriendo, o el servidor no arranca.
- Revisá las acciones de escritura (abrir PR, crear issue, mergear) antes de aprobarlas: quedan registradas en tu cuenta.

## Cuándo conviene

Cuando querés delegar la gestión de repos: triaje de issues, abrir PRs, leer y buscar código, o conectar tu flujo de desarrollo con el agente sin saltar todo el tiempo a la web de GitHub.
