---
titulo: Referencia completa de la CLI
parte: Apéndices
n: A
tipo: apendice
resumen: "Todos los subcomandos, flags y outputs de la CLI de Codex, para consulta rápida."
actualizado: 2026-05-30
---

## Subcomandos

| Comando | Qué hace |
|---|---|
| `codex` | Abre sesión REPL en el directorio actual |
| `codex login` | Auth via navegador (guarda en `~/.codex/credentials`) |
| `codex logout` | Cierra sesión |
| `codex whoami` | Muestra cuenta logueada y plan |
| `codex exec "<prompt>"` | Ejecuta una task one-shot |
| `codex apply <patch>` | Aplica un patch generado |
| `codex status` | Lista tasks activas y recientes |
| `codex tasks list` | Listado detallado de tasks |
| `codex tasks get <id>` | Detalle de una task |
| `codex tasks cancel <id>` | Cancela una task en curso |
| `codex model <nombre>` | Cambia el modelo por defecto |
| `codex config <get/set>` | Gestiona settings locales |

## Flags globales

| Flag | Descripción |
|---|---|
| `--model <nombre>` | Modelo para esta invocación |
| `--approval-mode <auto/ask/manual>` | Modo de aprobación |
| `--run-in <local/cloud>` | Dónde corre la task |
| `--branch <nombre>` | Branch base para Cloud |
| `--api-key <key>` | Override de credencial (útil en CI) |
| `--verbose` | Logs detallados |
| `--quiet` | Sin output extra |
| `--json` | Salida JSON parseable |

## Códigos de salida

- `0` — OK.
- `1` — Error genérico.
- `2` — Argumentos inválidos.
- `3` — Auth fallida.
- `4` — Rate limited.
- `5` — Task cancelada.
- `10` — Quota agotada.

## Ejemplos

```bash
codex exec "agregá tests al módulo X" --model codex-balanced --run-in cloud
codex tasks list --json | jq '.[] | select(.state=="awaiting_approval")'
codex status --quiet
```
