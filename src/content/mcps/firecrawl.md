---
titulo: Firecrawl (MCP)
nivel: avanzado
resumen: Servidor MCP para que el agente lea, rastree y extraiga datos de la web de forma estructurada.
descripcion: >
  Firecrawl le da a Claude la capacidad de navegar y extraer contenido de páginas web: buscar,
  rastrear sitios, scrapear y devolver datos limpios en formato estructurado. Útil para
  investigación, monitoreo y automatizaciones que dependen de información de la web.
comoConectar: >
  Necesitás una API key de Firecrawl (se obtiene gratis en firecrawl.dev). Agregás el MCP con
  el comando de Claude Code, pasando la clave como variable de entorno. NUNCA compartas tu
  clave real ni la subas a un repositorio.
funciones:
  - Buscar y rastrear páginas web
  - Extraer contenido estructurado (scraping)
  - Convertir páginas a texto/markdown limpio
comandos:
  - titulo: "Agregar el MCP (reemplazá TU_API_KEY)"
    comun: "claude mcp add firecrawl --env FIRECRAWL_API_KEY=TU_API_KEY -- npx -y firecrawl-mcp"
    nota: "Conseguí tu clave gratis en firecrawl.dev. No la pegues en lugares públicos."
enlaces:
  - texto: "mendableai/firecrawl-mcp-server (repo)"
    url: https://github.com/mendableai/firecrawl-mcp-server
  - texto: "Firecrawl (obtener API key)"
    url: https://www.firecrawl.dev
tags: [mcp, web, scraping, investigacion]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Cuando necesitás que el agente trabaje con datos de la web (no solo de su conocimiento),
Firecrawl es de los MCP más usados. Tratá tu API key como una contraseña.
