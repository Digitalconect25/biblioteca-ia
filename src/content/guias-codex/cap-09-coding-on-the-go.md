---
titulo: 'Coding On-The-Go: Workflows Reales'
parte: Codex Móvil
n: 9
tipo: capitulo
resumen: "Escenarios móviles reales — revisar bugs camino al trabajo, aprobar PRs en el commute, delegar a Cloud antes de dormir, debug de producción desde el café. Y cuándo NO codear en móvil."
objetivos:
  - Tener 3-4 patrones móviles listos para usar.
  - Saber cuándo conviene la app móvil y cuándo es mejor esperar a la laptop.
actualizado: 2026-05-30
---

La app móvil rinde cuando la usás para lo que es: **delegar y revisar**, no para tipear código.
Cuatro patrones reales:

## 1. Revisión matutina en el commute

8:00 — tomás el subte. Abrís Codex. Ves las tasks que dejaste corriendo anoche en Cloud:

- Refactor del módulo de pagos: terminada, esperando approval. Revisás diff archivo por archivo
  deslizando. Aprobás 4, comentás en 1, descartás 1. Abrís el PR.
- Migración de tests Jest a Vitest: 80% hecha, falló en 2 tests por timeouts. Subís el tiempo de
  timeout en un comentario, le pedís que reintente.
- Documentación del API: lista. Aprobás.

Llegás a la oficina con 3 cosas adelantadas sin haber tipeado una sola línea.

## 2. Delegación nocturna

23:00 — antes de dormir. Tres tasks largas:

- "Migrá `auth.js` de callbacks a async/await. Mantené la API pública igual. Asegurate de que los
  tests siguen pasando."
- "Generá tests para los endpoints en `routes/users/*` con la cobertura actual del 30% a 80%."
- "Actualizá todas las dependencias de package.json a su última minor; reporta cualquier breaking
  change que detectes."

Codex Cloud arranca los tres. Tu Mac queda libre (no consume tu CPU). Vos a dormir.

## 3. Bug fix desde el café

Cliente reporta un bug crítico mientras estás fuera. Sacás el teléfono:

- Foto del error que mandó el cliente → adjunto a una task nueva.
- "Encontrá la causa de este error y arreglalo. Agregá un test que lo reproduzca."

Codex toma la imagen, lee el stack trace, busca en el repo, propone un fix con test, abre PR. Vos
revisás desde el celular y aprobás. PR mergea via CI. Cliente feliz, vos seguís con tu café.

## 4. Pair programming asíncrono

Estás en una reunión que no podés cortar pero un compañero te pinga: "no entiendo este bug raro".
Le decís: "abrilo, lanzá una task en Codex con el log y mandame el link de la task". Vos vas
revisando lo que Codex propone desde la app móvil entre puntos de la reunión y le dejás comentarios.

## Cuándo NO codear en móvil

- **Pensar arquitectura nueva**: necesitás pizarra, no app de celular.
- **Refactors complejos que requieren leer mucho código a la vez**: la pantalla es chica, terminás
  aprobando cosas sin entender.
- **Cualquier cosa que toque producción**: aunque puedas, no lo hagas desde el celular. Llegás a la
  laptop, revisás con calma, después aprobás.
- **Tareas donde la latencia importa**: jugar a "explorar repo" con conexión móvil 4G frustra. Esperá
  al WiFi.

## El cambio de hábito

Lo más útil de la app móvil no es que "podés programar desde el celular". Es que **dejás de tener
ese ratito muerto donde "ojalá pudiera revisar ese PR"**. Ese ratito ahora es productivo.
