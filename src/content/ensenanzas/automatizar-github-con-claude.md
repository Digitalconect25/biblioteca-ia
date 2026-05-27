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

Esto convierte tu repo en un compañero de trabajo: pedís cambios desde un issue y aparecen
como PR para revisar. Empezá en un repo de prueba y revisá siempre los PR antes de fusionar.
