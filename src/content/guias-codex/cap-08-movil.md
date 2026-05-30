---
titulo: Codex en iOS y Android
parte: Codex Móvil
n: 8
tipo: capitulo
resumen: "App móvil: lanzar tasks, ver progreso, push notifications, diff viewer, aprobar PRs, adjuntos, dictado de voz, modo offline, diferencias entre iOS y Android."
objetivos:
  - Configurar la app móvil para usarla en el día a día.
  - Aprobar PRs y revisar diffs desde el teléfono cómodamente.
  - Entender qué se puede y qué no se puede hacer en móvil.
actualizado: 2026-05-30
---

La app móvil de ChatGPT trae Codex integrado. No es una "vista chiquita" del desktop: tiene su propio
diseño pensado para que **revises mientras te movés**.

## Lo que sí podés hacer

- **Lanzar tasks** en Codex Cloud contra cualquier repo conectado. Escribís el prompt o lo dictás.
- **Ver progreso en vivo** de tasks corriendo (con logs).
- **Diff viewer** swipeable (deslizás para pasar entre archivos del diff).
- **Aprobar/rechazar** cambios y abrir el PR desde el celular.
- **Comentar en PRs** directamente desde la app.
- **Subir adjuntos**: screenshots, fotos de pizarra, fotos de errores en pantalla.

## Lo que no podés (todavía)

- Tasks **locales** (necesitás tu Mac/PC con la app desktop o el CLI).
- Editar código de forma libre tipeando: no es un IDE.
- Correr `npm install` y servidores: para eso está Cloud.

## Push notifications

Configurá las notificaciones para:

- **Task completed** — cuando una task termina y espera tu aprobación.
- **PR review requested** — cuando Codex te dejó un comentario para resolver.

Ojo con tener todo en "alerta": vas a vibrar todo el día. Empezá con solo "Awaiting approval" y
sumá las demás si las necesitás.

## Dictado de voz

iOS y Android tienen dictado nativo, pero la app además tiene un botón de micrófono pensado para
prompts largos: empezás a hablar y va transcribiendo + mejorando. Útil para describir tasks en el
auto, caminando o en transporte público.

## Screenshots

Sacás una screenshot a un error o a un diseño, abrís la app y elegís "Adjuntar última captura". Le
podés decir "arreglá este error" o "implementá este diseño" y se vuelve una task con la imagen como
contexto.

## Modo offline

Si te quedás sin internet, las tasks no avanzan, pero podés:

- Redactar el prompt y dejarlo guardado en borradores; se manda cuando vuelve la conexión.
- Revisar diffs de tasks descargadas (los últimos 50 ítems se guardan offline).

## Diferencias iOS vs Android

| | iOS | Android |
|---|---|---|
| Widget | Sí, con tasks recientes | Sí, similar |
| Acceso por Siri/Assistant | Sí ("Hey Siri, nueva task en Codex…") | Sí, vía Google Assistant |
| Compartir desde otra app | Share sheet a Codex | Share sheet a Codex |
| Lock screen actions | Botón rápido en widget | Similar |
| Quick reply notifications | Sí | Sí |

A nivel de capacidades core, son equivalentes. Diferencias mínimas, más estéticas.

## El uso real

La app móvil no es "para programar en el celular". Es para **vigilar tu equipo de tasks** mientras
hacés otras cosas. Lanzás 3 tasks antes de salir de casa, las revisás en el commute, aprobás. El
celular se vuelve tu interfaz de revisión.
