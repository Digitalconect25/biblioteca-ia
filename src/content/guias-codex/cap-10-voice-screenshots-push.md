---
titulo: 'Voice, Screenshots y Push Notifications'
parte: Codex Móvil
n: 10
tipo: capitulo
resumen: "Dictado de voz para describir tasks, screenshot capture con AI que lee imágenes, notifications inteligentes, Siri y Google Assistant, widgets y lock screen actions, permisos y privacidad."
objetivos:
  - Dictar tasks con voz cuando no podés tipear.
  - Usar screenshots como contexto rico.
  - Configurar notificaciones que ayuden sin atosigar.
actualizado: 2026-05-30
---

## Voz: cuándo y cómo

El dictado nativo del teléfono funciona, pero Codex tiene un botón de micrófono **dedicado** que
hace dos cosas extra:

1. **Transcribe** mejor términos técnicos (TypeScript, Postgres, OAuth) porque ajusta el modelo de
   reconocimiento al contexto.
2. **Limpia** los "este", "o sea", "tipo" automáticamente. La task queda más prolija.

Usos típicos:

- En el auto (con manos libres legalmente): "Codex, nueva task: agregá un endpoint POST /users que
  reciba email y password y devuelva el JWT. Tests incluidos."
- Caminando: describís un bug que viste antes.
- En la cama, antes de dormir: dictás 3 ideas para que mañana arranque trabajándolas.

## Screenshots como contexto

Tres tipos de capturas que Codex entiende bien:

1. **Errores en terminal/log**: hace OCR del texto, detecta el stack trace, identifica el archivo y
   línea, busca en tu repo.
2. **Diseños / mockups**: lee la estructura visual y propone HTML/CSS/React.
3. **Screenshots de chat o ticket**: extrae el "qué se pide" y lo convierte en task.

Flujo: sacás la captura → abrís la app → "Adjuntar última captura" → describís en una línea qué
querés hacer con eso.

## Notifications: configuración recomendada

| Evento | ¿Notif? | Comentario |
|---|---|---|
| Task awaiting approval | Sí, prioridad alta | Es lo que cierra el loop |
| Task completed (auto-approve) | Sí, prioridad baja | Para enterarte sin urgencia |
| Task failed | Sí, prioridad alta | A veces hay que destrabarla |
| PR review requested | Sí, prioridad media | Si configuraste Codex como reviewer |
| Comentarios en PR | Sí, prioridad baja | |
| Cloud quota warning | Sí | Antes de quedarte sin |

Lo importante: NO actives "every event"; te volvés loco.

## Siri y Google Assistant

- **iOS**: "Hey Siri, new Codex task" abre el dictado de tasks en la app.
- **Android**: "Hey Google, abrí ChatGPT" + el shortcut "New Codex task" lo expone como acción.

Útil para arrancar tareas sin sacar el teléfono del bolsillo (con manos libres).

## Widgets y lock screen

- **iOS** (widget): muestra hasta 3 tasks recientes con su estado. Tap → abre la app en esa task.
- **Lock Screen / Dynamic Island**: las tasks corriendo en Cloud aparecen como Live Activity.
- **Android**: widget similar; con Material You toma colores del wallpaper.

## Permisos y privacidad

La app **pide** permisos para:

- Micrófono (voz).
- Cámara/Galería (screenshots y fotos de pizarra).
- Notificaciones.

**No** necesita:

- Acceso a contactos.
- Ubicación.
- Acceso a otros archivos de tu teléfono.

Si quieres revisar: iOS → Ajustes → ChatGPT; Android → Apps → ChatGPT → Permisos.

## Tip

Lo más útil para devs distraídos: configurá la notif de "task awaiting approval" como un sonido
distintivo (no el de WhatsApp). Asocías el sonido con "hay un diff esperando", lo revisás en
30 segundos, seguís.
