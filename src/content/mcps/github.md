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

Con este MCP el agente deja de estar "ciego" a tu GitHub: puede crear un issue, abrir un PR
o leer un repo por vos. Empezá por la opción remota, que no requiere manejar tokens.
