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

Firecrawl le da al agente la capacidad de salir a la web: buscar, rastrear sitios, scrapear páginas y devolver el contenido limpio en texto o markdown estructurado. Es de los MCP más usados cuando necesitás que el agente trabaje con información actual y real, no solo con lo que ya sabe. Sirve para investigación, monitoreo de páginas y automatizaciones que dependen de datos de la web.

## Cómo conectarlo, paso a paso

1. Verificá que tenés Node.js (`node --version`); el servidor corre con `npx`.

2. Conseguí tu API key gratis en firecrawl.dev (creás una cuenta y la copiás del panel).

3. Agregá el MCP con el comando de Claude Code, pasando la clave como variable de entorno:

```
claude mcp add firecrawl --env FIRECRAWL_API_KEY=TU_API_KEY -- npx -y firecrawl-mcp
```

Reemplazá TU_API_KEY por tu clave real. El comando es igual en Windows y en Mac.

4. Confirmá que quedó conectado:

```
claude mcp list
```

## Ejemplo real

Con el MCP listo, le pedís que traiga y procese contenido de la web:

```
Entrá a estos tres blogs de la competencia, extraé los títulos de sus últimos posts y armame una tabla comparando los temas que tocan.
```

## Seguridad y errores comunes

- Tratá tu API key como una contraseña: nunca la pegues en lugares públicos ni la subas a un repositorio. En ejemplos, usá siempre TU_API_KEY.
- Si la clave queda expuesta, regenerala desde el panel de Firecrawl.
- La cuenta gratis tiene un límite de créditos; si las extracciones fallan de golpe, revisá si llegaste al tope.
- Algunos sitios bloquean el scraping o cargan con JavaScript; si una página vuelve vacía, puede ser eso y no un error de config.

## Cuándo conviene

Cuando el agente necesita datos frescos de internet: investigar competidores, juntar información de varias páginas, convertir artículos a texto limpio o monitorear sitios. Es la puerta de entrada del agente a la web abierta.
