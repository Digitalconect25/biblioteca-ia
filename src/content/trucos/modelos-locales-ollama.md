---
titulo: Corré modelos de IA en tu propia PC (privacidad y gratis)
nivel: avanzado
resumen: Con Ollama podés ejecutar modelos de pesos abiertos en tu computadora, sin internet y sin enviar tus datos.
descripcion: >
  No toda la IA vive en la nube. Con herramientas como Ollama podés descargar modelos de pesos
  abiertos (Llama, Mistral, DeepSeek y otros) y ejecutarlos en tu propia máquina. Las ventajas:
  privacidad total (tus datos no salen de tu PC), funciona sin conexión y no pagás por uso. La
  contra: necesitás un equipo con recursos (idealmente buena RAM o GPU) y los modelos que
  corren localmente suelen ser más chicos que los de la nube. Es ideal para datos sensibles,
  para aprender cómo funcionan los modelos o para integrarlos en proyectos propios.
herramienta: Ollama
ejemplo: |
  Después de instalar Ollama, en la terminal:
  ollama run llama3.2   (descarga el modelo y abre un chat local)
comandos:
  - titulo: "Instalar Ollama en macOS"
    mac: "brew install ollama"
    nota: "También podés bajar el instalador desde ollama.com/download."
  - titulo: "Instalar Ollama en Windows"
    windows: "winget install Ollama.Ollama"
    nota: "O descargá el instalador desde ollama.com/download."
  - titulo: "Descargar y chatear con un modelo (cualquier SO)"
    comun: "ollama run llama3.2"
    nota: "La primera vez descarga el modelo; después funciona sin internet."
enlaces:
  - texto: Ollama (sitio oficial)
    url: https://ollama.com
  - texto: Ollama (repositorio en GitHub)
    url: https://github.com/ollama/ollama
tags: [local, privacidad, ollama, pesos-abiertos, open-source, avanzado]
actualizado: 2026-05-27
revisarAntesDe: 2026-08-27
---

Correr un modelo en tu PC es la forma más privada de usar IA: nada sale de tu equipo. Empezá
con un modelo chico para ver cómo anda tu hardware y subí de tamaño desde ahí.
