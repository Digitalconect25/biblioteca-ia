---
titulo: Tu segundo cerebro con Claude + Obsidian
nivel: intermedio
herramienta: Claude + Obsidian
tiempo: 1-2 horas
resumen: "Conectá Claude a tu bóveda de Obsidian y convertí tus notas en un asistente que lee, busca y redacta por vos."
descripcion: >
  El método que ordena el caos de un negocio sin equipo: tus clientes, proyectos, reuniones e
  ideas en Obsidian, y Claude conectado a esa bóveda por MCP. En vez de pegar contexto en cada
  chat, el agente lo lee de tus notas y trabaja sobre él (presupuestos, seguimientos, briefings).
objetivo: Dejar a Claude conectado a tu bóveda de Obsidian y resolver tu primera tarea real con tus notas.
requisitos:
  - Obsidian instalado (gratis, obsidian.md)
  - Un cliente con MCP (Claude Code o Claude Desktop)
  - Node.js instalado (para la mayoría de los servidores MCP)
pasos:
  - titulo: "1. Instalá Obsidian y creá tu bóveda"
    detalle: "Descargá Obsidian desde obsidian.md y creá una bóveda local (tus datos quedan en tu equipo)."
  - titulo: "2. Armá la estructura de tu negocio"
    detalle: "Creá carpetas para tu flujo. Una nota por cliente, una por proyecto, y reuniones por fecha."
    comun: |
      Clientes/      (una nota por cliente, con historial)
      Proyectos/     (estado, plazos y acuerdos)
      Reuniones/     (puntos clave por fecha)
      Ideas/         (capturas rápidas)
  - titulo: "3. Instalá un servidor MCP de Obsidian"
    detalle: "Elegí un servidor open-source (ver recursos) y seguí su README. Algunos usan el plugin community 'Local REST API' de Obsidian + una API key."
  - titulo: "4. Apuntá Claude a tu bóveda"
    detalle: "En la config MCP de tu cliente, indicá la ruta absoluta de la bóveda. Reiniciá el cliente para que cargue el servidor."
  - titulo: "5. Probá con una orden real"
    detalle: "Escribí una instrucción en lenguaje natural y mirá cómo Claude usa tus notas."
    comun: 'Leé /Proyectos y dame un resumen de los proyectos activos con sus próximos plazos, priorizado.'
enlaces:
  - texto: "Obsidian (descarga)"
    url: https://obsidian.md
  - texto: "StevenStavrakis/obsidian-mcp (servidor MCP)"
    url: https://github.com/StevenStavrakis/obsidian-mcp
  - texto: "jacksteamdev/obsidian-mcp-tools"
    url: https://github.com/jacksteamdev/obsidian-mcp-tools
tags: [obsidian, mcp, productividad, segundo-cerebro, automatizacion]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Cuatro roles que cubre este sistema: asistente personal (agenda y seguimiento), gestor de
proyectos (tareas y plazos), redactor (presupuestos, emails, propuestas) y analista (resume
reuniones y detecta patrones). Todo a partir de tus notas.

## Qué tener en cuenta

Obsidian guarda todo en texto plano local: rápido, privado y sin suscripción. El servidor MCP
es lo que le da a Claude acceso; elegí uno mantenido y revisá qué permisos pide. Si usa el plugin
"Local REST API", su API key es sensible: no la compartas ni la subas a ningún lado.

## Si algo falla

- **Claude no ve la bóveda.** Revisá que la ruta en la config MCP sea absoluta y correcta, y reiniciá el cliente.
- **El servidor no arranca.** Confirmá Node.js instalado y seguí el README del servidor (versiones cambian).
- **Pide API key.** Activá el plugin "Local REST API" en Obsidian y copiá la key a la config del servidor.
- **Escribió donde no querías.** Sé específico con la carpeta/nota destino en el prompt; trabajá sobre una copia al principio.

## Siguiente nivel

- Pedile briefings antes de cada llamada: "Tengo una llamada con [cliente], leé su carpeta y resumime el historial y los pendientes".
- Automatizá seguimientos: "Revisá /Clientes, detectá los que no respondieron y redactá 3 emails personalizados".
- Usá una nota de "instrucciones" en la bóveda para que Claude trabaje siempre con tu criterio y tono.
