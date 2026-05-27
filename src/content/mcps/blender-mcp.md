---
titulo: Blender MCP
nivel: avanzado
resumen: MCP que conecta Blender con Claude para modelar en 3D con instrucciones de texto.
descripcion: >
  Blender MCP (de ahujasid) conecta Blender —el programa de 3D gratuito y open-source— con
  Claude. Le pedís en lenguaje natural que cree objetos, escenas y materiales, y el agente
  los construye dentro de Blender. Ideal para empezar en 3D sin saber usar todas las
  herramientas del programa.
comoConectar: >
  Necesitás Blender instalado y "uv" (un gestor de Python rápido). Instalás uv con el comando
  de tu sistema, instalás el addon de Blender desde el repo y agregás el servidor MCP a tu
  agente. Los pasos completos están en el repo y en la guía en español.
funciones:
  - Crear objetos y escenas 3D desde texto
  - Aplicar y modificar materiales
  - Automatizar tareas repetitivas en Blender
comandos:
  - titulo: "1. Instalar uv (gestor de Python)"
    windows: "powershell -ExecutionPolicy ByPass -c \"irm https://astral.sh/uv/install.ps1 | iex\""
    mac: "curl -LsSf https://astral.sh/uv/install.sh | sh"
  - titulo: "2. Correr el servidor MCP"
    comun: "uvx blender-mcp"
    nota: "Además hay que instalar el addon de Blender desde el repo. Ver pasos completos en el enlace."
enlaces:
  - texto: "ahujasid/blender-mcp (repo, 22k⭐)"
    url: https://github.com/ahujasid/blender-mcp
  - texto: "Guía en español (tododeia)"
    url: https://www.tododeia.com/community/blender-mcp
  - texto: "Blender (programa gratis)"
    url: https://www.blender.org
tags: [mcp, 3d, blender, diseno]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Una de las formas más impresionantes de ver el poder de los MCP: describís una escena y
aparece en 3D. Empezá con objetos simples y subí la complejidad de a poco.
