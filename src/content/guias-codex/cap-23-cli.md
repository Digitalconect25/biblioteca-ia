---
titulo: 'Codex CLI: Resumen Práctico'
parte: Avanzado
n: 23
tipo: capitulo
resumen: "Cuándo CLI > app, instalación, comandos más usados (codex, codex exec, codex apply, codex status), workflow CLI + app, modos de aprobación. Referencia completa en apéndice A."
objetivos:
  - Conocer los comandos esenciales de la CLI.
  - Usar la CLI para CI y scripting.
  - Combinar CLI con la app para lo mejor de los dos mundos.
actualizado: 2026-05-30
---

La CLI es para los que viven en la terminal y para CI. Si nunca abrís la app de ChatGPT y vivís en
`tmux`, este capítulo es para vos.

## Cuándo CLI > app

- Estás en un servidor sin GUI.
- Estás en CI/CD (GitHub Actions, GitLab, Jenkins).
- Querés pipear: `git diff | codex review --stdin`.
- Preferís scriptear (bash, fish, zsh) sobre clickear.
- Estás en sesiones SSH.

## Instalación

```bash
brew install openai/tap/codex
# o
npm i -g @openai/codex
codex login   # o set OPENAI_API_KEY
```

## Comandos esenciales

### Sesión interactiva
```bash
codex   # abre REPL contra el repo actual
```
Escribís prompts, ves respuestas, aprobás cambios con `y`/`n`. Para refactors guiados.

### Ejecución one-shot
```bash
codex exec "Agregá tests al archivo foo.ts"
```
Lanza una task no interactiva, te devuelve el resultado.

### Apply (aplicar cambios)
```bash
codex apply ./diff.patch
```
Útil con patches generados por Codex Cloud que querés revisar localmente antes de aplicar.

### Status
```bash
codex status
```
Lista tus tasks corriendo (locales y Cloud), su estado, tokens consumidos.

### Login / logout
```bash
codex login        # OAuth en navegador
codex logout
codex whoami
```

### Modelo y modo
```bash
codex --model codex-balanced exec "..."
codex --approval-mode auto exec "..."   # auto, ask, manual
```

## Workflow CLI + app

Patrón híbrido común:

- **Plan** en la app (es más cómodo para explorar y editar el plan).
- **Ejecución** en CLI (rápido, pipeable, scripteable).
- **Review** en la app (diff viewer visual).

Eso se logra porque las tasks lanzadas en CLI aparecen en el dashboard de la app (y viceversa).

## Modos de aprobación

| Modo | Comportamiento |
|---|---|
| `auto` | Aplica cambios sin preguntar (peligroso fuera de sandboxes) |
| `ask` | Te pregunta antes de cada cambio |
| `manual` | Te muestra el diff, no aplica nada (vos lo aplicás con `codex apply`) |

Recomendación: `manual` o `ask` en repos de producción. `auto` solo en sandboxes Cloud.

## Ejemplo: CI con codex

`.github/workflows/codex-review.yml`:

```yaml
jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm i -g @openai/codex
      - run: codex exec "Review el último commit. Comentá problemas obvios."
        env:
          OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
```

## Tip

`codex` solo (sin args) en cualquier repo te tira a una sesión REPL con contexto del directorio.
Es la forma más rápida de "preguntale algo a Codex sobre este código" sin abrir la app.

> La referencia completa de subcommands, flags y outputs está en el **Apéndice A**.
