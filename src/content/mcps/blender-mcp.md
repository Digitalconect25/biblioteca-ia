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

Blender MCP conecta Blender, el programa de 3D gratuito y open-source, con Claude. Le describís en lenguaje natural lo que querés (objetos, escenas, materiales) y el agente lo construye dentro de Blender por vos. Es una de las formas más impresionantes de ver el poder de los MCP: pedís una escena y aparece modelada en 3D, sin tener que dominar todas las herramientas del programa.

## Cómo conectarlo, paso a paso

1. Instalá Blender desde blender.org si todavía no lo tenés.

2. Instalá `uv`, un gestor de Python rápido. En Mac:

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

En Windows, desde PowerShell:

```
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

3. Corré el servidor MCP:

```
uvx blender-mcp
```

4. Instalá el addon de Blender desde el repo y activalo dentro de Blender. Los pasos completos del addon, que dependen de tu versión de Blender, están en el repositorio y en la guía en español enlazada en esta ficha. Una vez instalado el addon y agregado el servidor a tu agente, ya podés pedirle escenas.

## Ejemplo real

Con todo conectado, describís lo que querés crear:

```
Creá una mesa de madera con tres manzanas rojas encima y una lámpara que ilumine la escena desde arriba.
```

## Seguridad y errores comunes

- Necesitás `uv` y Blender instalados antes de arrancar; si `uvx blender-mcp` falla, casi siempre es porque falta `uv` o no está en el PATH.
- El addon tiene que estar instalado y activo dentro de Blender, o el agente no puede comunicarse con el programa.
- Guardá tu archivo .blend seguido: el agente puede modificar la escena y conviene tener puntos de retorno.
- Empezá con la escena vacía o con un archivo de prueba, no sobre un proyecto importante.

## Cuándo conviene

Cuando querés explorar modelado 3D sin saber usar Blender a fondo, prototipar escenas rápido o automatizar tareas repetitivas dentro del programa. Empezá con objetos simples y subí la complejidad de a poco.
