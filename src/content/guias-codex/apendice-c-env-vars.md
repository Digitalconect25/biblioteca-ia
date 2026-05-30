---
titulo: Variables de entorno
parte: Apéndices
n: C
tipo: apendice
resumen: "Variables de entorno que Codex lee, cómo afectan cada superficie y ejemplos de uso."
actualizado: 2026-05-30
---

## Variables principales

| Variable | Para qué |
|---|---|
| `OPENAI_API_KEY` | API key para CLI y SDK |
| `CODEX_API_KEY` | Alternativa, prioritaria sobre la anterior |
| `CODEX_MODEL` | Modelo por defecto (override de config) |
| `CODEX_APPROVAL_MODE` | `auto` / `ask` / `manual` |
| `CODEX_RUN_IN` | `local` / `cloud` |
| `CODEX_CONFIG_DIR` | Override de `~/.codex` |
| `CODEX_LOG_LEVEL` | `error` / `warn` / `info` / `debug` |
| `CODEX_NO_COLOR` | Desactiva colores en CLI |
| `CODEX_NO_TELEMETRY` | Desactiva telemetría |
| `HTTPS_PROXY` / `HTTP_PROXY` | Proxy corporativo |

## En CI (ejemplo GitHub Actions)

```yaml
env:
  OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
  CODEX_APPROVAL_MODE: auto
  CODEX_LOG_LEVEL: info
```

## En desarrollo local

```bash
# ~/.zshrc
export OPENAI_API_KEY="sk-..."
export CODEX_MODEL="codex-balanced"
```

## En Codex Cloud (setup.sh)

Para variables que **necesita tu app** (no Codex en sí):

```bash
# .codex/setup.sh
export DATABASE_URL="postgres://test:test@localhost/test"
export REDIS_URL="redis://localhost:6379"
```

## Reglas

- **Nunca commitees archivos `.env` con valores reales.**
- Para CI, usá los secrets del runner.
- Para Cloud, usá Project Env Vars (encriptadas en OpenAI).
- Variables `OPENAI_*` y `CODEX_*` tienen precedencia sobre archivos de config.
