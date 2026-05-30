---
titulo: Integración GitHub y PRs Automáticos
parte: Codex Web y Cloud
n: 13
tipo: capitulo
resumen: "Auth con GitHub para repos públicos/privados y orgs, Codex como reviewer, comentarios inline en PRs, sync con issues, GitHub Actions, mejores prácticas de seguridad."
objetivos:
  - Conectar GitHub correctamente (incluyendo orgs).
  - Configurar a Codex como reviewer automático.
  - Cerrar el loop tarea → PR → review → merge sin fricción.
actualizado: 2026-05-30
---

GitHub es la columna vertebral del flujo de Codex. Sin GitHub, Cloud se queda corto: los PRs son el
producto final de la mayoría de tasks.

## Conectar GitHub

En `chatgpt.com/codex` → Settings → Connections → GitHub. Autorizás:

- Cuenta personal: para tus repos propios.
- Organizaciones: cada org necesita aprobación de un admin de esa org.

Permisos que pide:

- Lectura de repos (para clonar y leer).
- Escritura de branches (para abrir PRs).
- Lectura/escritura de issues (para sync, si lo activás).

## Codex como reviewer

En el dashboard del repo en Codex, activás **"Auto-review PRs"**. A partir de ahí, cada PR nuevo
recibe:

- Comentario general con resumen y posibles problemas (estilo, bugs obvios, perf).
- Comentarios inline sobre líneas específicas.
- Sugerencias de cambio (que se aplican con un click).

Configurás criterios:

- Solo en PRs etiquetados `needs-review`, o todos.
- Excluir paths (no revisar `vendor/`, `dist/`).
- Severidad mínima (no comentar sobre estilo si el estilo ya pasa el linter).

## Comentarios inline en PRs

Cuando hacés review tradicional y dejás un comentario, Codex puede responder/actuar:

- Mencionalo: `@codex revisá esta función a fondo`.
- O comandos específicos: `@codex agregá tests para esto`.

Codex toma el contexto del PR + el comentario, propone un cambio en el mismo PR (un nuevo commit) o
abre un PR separado.

## Sync con issues

Opcional pero potente. Activado:

- Cuando creás un issue, podés agregarle el label `codex`. Codex lee el issue y propone un PR.
- Los comentarios en el issue se convierten en instrucciones de la task.

## GitHub Actions

Codex puede integrarse a Actions:

- **Pre-PR**: action que corre `codex review` localmente y deja comentarios antes del review humano.
- **Auto-fix**: action que detecta builds fallidos y le pide a Codex Cloud que arregle.
- **Documentation drift**: action diaria que pide a Codex que actualice el README si los APIs cambiaron.

Templates oficiales hay en `github.com/openai/codex-actions`.

## Seguridad

Cuidados:

- **No le des acceso a orgs con código sensible si no lo necesitás**. La autorización es granular.
- **Revisá los PRs como cualquier otro**: no merges automáticamente sin tests/CI verde + review humana.
- **Secrets**: nunca pongas secrets en `AGENTS.md` ni en el repo. Codex los puede leer también (es
  parte del repo). Usá GitHub Secrets / setup.sh con variables de entorno.
- **Branch protection**: mantené reglas que requieran approvals humanos, aunque Codex haya
  reviewado. Es defensa en profundidad.

## Anti-patrón

Configurar `codex auto-merge` en producción. Aunque sea tentador, no. Que Codex abra y prepare el PR;
el merge final siempre con review humana.
