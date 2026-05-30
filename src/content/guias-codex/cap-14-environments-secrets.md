---
titulo: 'Environments, Secrets y Networking'
parte: Codex Web y Cloud
n: 14
tipo: capitulo
resumen: "Configuración de tasks en Cloud — setup.sh, env vars por proyecto, manejo de secrets, acceso a red on/off, sandbox vs open, caching, regla de oro de no commitear secrets."
objetivos:
  - Configurar un proyecto para que Codex Cloud lo levante igual que tu local.
  - Manejar secrets sin filtrar nada al repo.
  - Saber cuándo abrir o cerrar la red para una task.
actualizado: 2026-05-30
---

## El archivo `.codex/setup.sh`

Es el script que corre Codex Cloud apenas clona el repo. Ejemplo:

```bash
#!/usr/bin/env bash
set -euo pipefail
# Versión de Node:
nvm install
# Dependencias:
pnpm install --frozen-lockfile
# DB de pruebas:
docker run -d --name pg -e POSTGRES_PASSWORD=test -p 5432:5432 postgres:17
# Migraciones:
pnpm db:migrate
echo "Setup OK"
```

Tip: que termine con un `echo` claro, así los logs te confirman que terminó bien.

## Variables de entorno

Dos formas de pasarlas:

1. **Por proyecto en Codex** (Settings → Project → Env vars). Quedan encriptadas en OpenAI y se
   inyectan al sandbox. Útil para `DATABASE_URL`, `API_KEY` de servicios externos para tests.
2. **En el repo, NO como secrets**: en `.env.example` listás los nombres (no valores) que el código
   espera.

## Secrets: la regla de oro

**Nunca, jamás, comites secrets reales.** Repetí: nunca. Si Codex puede leer tu repo, puede leer
tus secrets. Y si los lee, los puede meter sin querer en logs, en código que llegue al PR, etc.

Lista mínima de buenas prácticas:

- `.gitignore`: `.env`, `.env.production`, `*.pem`, `*.key`, `credentials.json`.
- En `setup.sh` referenciá secrets vía variables: `export DATABASE_URL=$DATABASE_URL` (Codex las
  inyecta desde la config del proyecto, no del repo).
- Rotá secrets cada cierto tiempo, especialmente después de incidentes.

Si Codex te pide un secret en un PR ("hardcodea esta API key para testear"), es un anti-patrón:
no aceptes. Pedile que use una variable de entorno.

## Networking: sandbox cerrado vs abierto

Por defecto, Codex Cloud corre en **sandbox cerrado**: sin acceso a internet. Esto es bueno (sin
exfiltración de datos), pero limita lo que la task puede hacer.

Configurable:

- **Cerrado total**: sin red. Solo puede usar lo que ya viene en el clone + lo que instala el setup.
- **Allowlist de dominios**: red solo a hosts que vos autorices (`registry.npmjs.org`, `github.com`).
  Recomendado.
- **Abierto**: la task puede hacer requests a cualquier dominio. Útil para tasks que llaman APIs
  externas, pero abre la puerta a exfiltración. Usalo solo cuando hace falta.

## Caching

Cloud cachea dependencias de tareas previas si el `lockfile` no cambió. Eso hace que la segunda task
en el mismo repo arranque mucho más rápido. Para forzar reinstall: borrá la cache desde la UI del
repo.

## Tip de seguridad

Si tu repo tiene secrets viejos en el historial git (cosa que pasa), Codex también los podría leer al
explorar. Pasale `git log` por encima con herramientas como `gitleaks` antes de habilitar Codex en
un repo viejo, y rotá lo que aparezca.
