---
titulo: 'Codex Cloud: Delegación de Tareas Largas'
parte: Codex Web y Cloud
n: 12
tipo: capitulo
resumen: "Qué es Cloud y cuándo delegar vs local, tasks ideales (refactors grandes, migraciones, batch jobs), límites, logs en vivo, concurrencia, automatización de branches y PRs."
objetivos:
  - Decidir cuándo correr en Cloud y cuándo en local.
  - Lanzar tasks largas y delegar la espera.
  - Entender la concurrencia y los límites del plan.
actualizado: 2026-05-30
---

Codex Cloud es **una sandbox en la infraestructura de OpenAI** donde tu task corre incluso si cerrás
el navegador. Es la diferencia entre "Codex me ayuda en mi laptop" y "Codex es un colega
asíncrono".

## Cuándo conviene Cloud

- Tareas que tocan **muchos archivos** (refactors a escala, migraciones, búsquedas).
- Tareas que llevan **minutos u horas**: querés irte y volver.
- Tareas que necesitan **correr `npm install` u otros builds pesados** que no querés en tu Mac.
- **Batch jobs**: arreglar el mismo bug en N repos.
- Cualquier task que querés que **abra un PR automáticamente**.

## Cuándo NO conviene Cloud (mejor local)

- Necesitás acceso a un **servicio en tu máquina** (DB local, túneles, secrets que no querés subir).
- Estás iterando rápido y necesitás **latencia mínima** (cada cambio en 5 segundos).
- Cosas con archivos que **no están en Git** (drafts no commiteados).

## Cómo lanzar una task en Cloud

Desde la web (o desktop/móvil), al crear nueva task:

1. **Repo** + branch base.
2. **Setup script** (opcional, `.codex/setup.sh`): instala deps, configura env vars, levanta DBs.
3. **Modelo y modo de aprobación**.
4. Marcás **"Run in Cloud"**.
5. Lanzás. Codex clona el repo, corre `setup.sh`, ejecuta la task.

## Límites y concurrencia

Depende del plan (ver capítulo 24 para detalles):

- **Plus**: tasks paralelas limitadas (suele ser 1-3 simultáneas).
- **Pro/Team**: más concurrencia y más tokens incluidos.
- **Enterprise**: cuotas configurables por org.

Cada task tiene **timeout** (suele ser 30-60 min para Cloud, depende del plan).

## Logs en vivo

Mientras la task corre, ves los pasos y los outputs de comandos. Útil para:

- Detectar si quedó en loop ("Reading file X" repetido 10 veces).
- Ver por qué fallan tests.
- Cancelar a tiempo si vas a desperdiciar tokens.

## Automatización de branches y PRs

Codex Cloud crea un branch nuevo (`codex/task-<id>` por defecto) y, al terminar, puede:

- **Abrir el PR automático** contra el branch base.
- Asignarte como reviewer.
- Etiquetar el PR (`codex`, `auto-generated`).
- Comentar en un issue relacionado si lo mencionaste.

Configurable en `.codex/settings.json` o en el dashboard.

## Tip: el patrón "task antes de dormir"

A las 23:00 lanzás 3-5 tasks largas con `Run in Cloud`. Te vas a dormir. A las 8:00 abrís el celular y
encontrás los PRs esperando review. Es la forma más rentable de usar Cloud: aprovechás el tiempo que
no estás trabajando.

## Anti-patrón

Lanzar una task vaga ("mejorá el código") a Cloud. Sin objetivo claro, el modelo consume tokens
explorando y vuelve con un diff enorme y disperso. Sé específico: "extraé esta lógica a un módulo,
agregá tests, no cambies la API pública".
