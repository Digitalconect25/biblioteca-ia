---
titulo: Automatizar tu repo de GitHub con Claude
nivel: avanzado
herramienta: Claude Code + GitHub Action
tiempo: 30 min
resumen: Hacé que Claude responda en issues y PRs y aplique cambios solo, directo en GitHub.
descripcion: >
  Con la GitHub Action oficial de Claude Code podés mencionar a @claude en un issue o Pull
  Request y que actúe: implementa cambios, abre PRs, contesta preguntas sobre el código. Es
  automatización de verdad en tu repositorio, corriendo en la nube de GitHub Actions.
objetivo: Dejar configurado tu repo para que @claude trabaje automáticamente en issues y PRs.
requisitos:
  - Un repositorio en GitHub donde seas admin
  - Claude Code instalado localmente (ver la enseñanza de Claude Code)
  - Una cuenta de Anthropic con API key o crédito disponible
pasos:
  - titulo: "1. Instalar la GitHub App de Claude (la forma más fácil)"
    detalle: "Desde Claude Code, en tu repo, corré este comando. Te guía para instalar la app y crear el workflow y los secretos automáticamente."
    comun: "/install-github-app"
  - titulo: "2. (Alternativa manual) Agregar el workflow"
    detalle: "Si preferís hacerlo a mano, creá .github/workflows/claude.yml con la Action oficial. Revisá el README del repo para los inputs exactos."
    comun: |
      name: Claude
      on:
        issue_comment:
          types: [created]
      jobs:
        claude:
          runs-on: ubuntu-latest
          steps:
            - uses: anthropics/claude-code-action@v1
              with:
                anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
  - titulo: "3. Cargar el secreto con tu API key"
    detalle: "En GitHub: Settings → Secrets and variables → Actions → New repository secret. Nombre: ANTHROPIC_API_KEY. La app del paso 1 puede hacer esto por vos."
  - titulo: "4. Usar @claude"
    detalle: "Comentá en un issue o PR mencionando a @claude con lo que querés. La Action corre y Claude responde o abre un PR con los cambios."
    comun: '@claude implementá esta función y abrí un PR con los cambios y una breve explicación.'
enlaces:
  - texto: "anthropics/claude-code-action (Action oficial, 7.7k⭐)"
    url: https://github.com/anthropics/claude-code-action
  - texto: "anthropics/claude-code (repo oficial)"
    url: https://github.com/anthropics/claude-code
tags: [automatizacion, github, ci, claude, action]
actualizado: 2026-05-27
revisarAntesDe: 2026-09-27
---

Al terminar vas a poder mencionar a @claude en cualquier issue o PR y que actúe solo: implementa el cambio, abre un PR y te lo deja listo para revisar. Tu repo pasa a tener un colaborador que trabaja en la nube de GitHub Actions, sin que tengas que abrir la terminal.

## Qué tener en cuenta

Necesitás ser admin del repo: instalar la GitHub App, crear el workflow y cargar secretos requieren ese permiso. Si trabajás en un repo de una organización, puede que tengas que pedirle a quien administre que apruebe la app.

Cada vez que @claude responde, corre la Action y consume crédito de tu cuenta de Anthropic. Un repo público y muy activo puede gastar rápido si cualquiera puede dispararla, así que conviene empezar en un repo privado o de prueba. El `ANTHROPIC_API_KEY` se guarda como secreto del repositorio: nunca lo pegues en el workflow ni en un comentario. Tené presente también que la Action consume minutos de GitHub Actions, que tienen su propia cuota.

## Si algo falla

- **`/install-github-app` no hace nada.** Corré el comando desde Claude Code parado dentro de la carpeta del repo, no en una carpeta cualquiera, y con la sesión de Claude ya iniciada.
- **@claude no responde al comentario.** Andá a la pestaña Actions del repo y mirá si el workflow se disparó. Si no aparece, revisá que el archivo esté en `.github/workflows/` y que el evento (`issue_comment`) coincida con dónde comentaste.
- **La Action corre pero falla con error de autenticación.** Verificá que el secreto se llame exactamente `ANTHROPIC_API_KEY` y que tu cuenta tenga crédito disponible.
- **Claude abre el PR pero contra la rama equivocada.** Indicale en el comentario contra qué rama base querés el PR.
- **Tarda mucho en arrancar.** La primera corrida levanta el runner desde cero; las siguientes son más rápidas.

## Siguiente nivel

- Configurá que @claude reaccione también a etiquetas o a aperturas de issue, no solo a comentarios.
- Pedile revisiones automáticas de cada PR nuevo antes de fusionar.
- Combinalo con la revisión cruzada de Codex (ver la enseñanza de Claude y Codex en equipo) para una segunda mirada sobre el código.
