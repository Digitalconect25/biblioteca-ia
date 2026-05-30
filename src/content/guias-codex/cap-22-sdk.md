---
titulo: 'Codex SDK: Automatizar Codex Programáticamente'
parte: Avanzado
n: 22
tipo: capitulo
resumen: "Paquetes npm y pip, auth, API de tasks, polling de status, webhooks, ejemplos (refactor nocturno, Slack bot, CI auto-review), rate limits y costos vs API directa de OpenAI."
objetivos:
  - Lanzar tasks de Codex desde código.
  - Construir automatizaciones (CI, bots, scheduled jobs).
  - Conocer la relación con la API directa de OpenAI.
actualizado: 2026-05-30
---

El SDK de Codex te deja **disparar tasks programáticamente**. Si tu flujo tiene "lanzo X tasks cada
semana", el SDK + un cron lo automatiza.

## Instalación

```bash
# Node
npm i @openai/codex-sdk

# Python
pip install openai-codex
```

## Auth

```ts
import { Codex } from '@openai/codex-sdk';
const codex = new Codex({ apiKey: process.env.OPENAI_API_KEY });
```

La API key debe tener scope para Codex (no la misma que para Chat completions; configurá en
platform.openai.com).

## API de tasks

```ts
// Crear task
const task = await codex.tasks.create({
  repo: 'usuario/repo',
  branch: 'main',
  runIn: 'cloud',
  model: 'codex-balanced',
  prompt: 'Agregá tests al módulo users con coverage 80%.',
});

// Polling
while (true) {
  const status = await codex.tasks.get(task.id);
  if (status.state === 'awaiting_approval' || status.state === 'done') break;
  await sleep(5000);
}

// Aprobar (si quisieras automatizar; cuidado)
await codex.tasks.approve(task.id);
```

## Webhooks (recomendado sobre polling)

Más eficiente que pollear:

```ts
// En tu server
app.post('/webhooks/codex', (req, res) => {
  const event = req.body;
  if (event.type === 'task.completed') {
    notifySlack(event.task.url);
  }
  res.sendStatus(200);
});
```

Registrás el webhook desde el dashboard de Codex.

## Ejemplos reales

### Refactor nocturno (cron)
```ts
// cron diario 23:00
const refactors = ['module-a', 'module-b', 'module-c'];
for (const mod of refactors) {
  await codex.tasks.create({
    repo: '...',
    prompt: `Refactor del módulo ${mod}: extraé tipos a archivos separados.`,
    runIn: 'cloud',
  });
}
```

### Slack bot que recibe slash commands
Tu bot recibe `/codex new-task ...` → llama al SDK → devuelve link de la task.

### CI auto-review
En tu pipeline: cuando se abre un PR, llamás al SDK con `prompt: review PR #X` → Codex deja
comentarios automáticos antes del review humano.

## Rate limits y costos

- **Tasks paralelas**: limitadas según el plan (Plus < Pro < Team < Enterprise).
- **Costo por task**: tokens consumidos (input + output del modelo).
- **API directa de OpenAI**: si solo necesitás generar código sin agente, la API estándar es más
  barata. Codex SDK cobra por el "andamiaje del agente" (lectura de repo, gestión de sandbox).

## Cuándo usar SDK vs UI

| Caso | UI | SDK |
|---|---|---|
| Tarea puntual | ✓ | |
| Refactors repetitivos | | ✓ |
| Integración con tu sistema | | ✓ |
| Equipos no-técnicos | ✓ | |
| Cron jobs | | ✓ |

## Tip

Tu primer script con el SDK que valga la pena: "todos los lunes, abrí una task para cada repo
activo pidiendo el listado de dependencias outdated con su nivel de riesgo de upgrade". Te
devuelve un PR semanal con el resumen. Tiempo invertido: 1 hora. Tiempo ahorrado: 4 hrs/mes.
