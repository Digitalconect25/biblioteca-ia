---
titulo: Changelog de Codex (Mayo 2026)
parte: Apéndices
n: E
tipo: apendice
resumen: "Cambios de modelos, integraciones y app por versión, para mantener la guía actualizada."
actualizado: 2026-05-30
---

> Este apéndice se actualiza con cada nueva edición de la guía. Si la versión que estás leyendo es
> de un mes anterior al actual, revisá la última en `academia.conectanex.com/guias/codex/apendice-e-changelog`.

## Mayo 2026 (primera edición de esta guía)

### Modelos
- Familia activa: rápido, balanceado, reasoner.
- Modos thinking on/off en balanceado y reasoner.
- Mejoras de contexto largo (200k+ tokens estables).

### App
- Hot corner para macOS y Windows.
- Screenshot tool con OCR + detección automática del tipo de captura.
- Dictado de voz con normalización de términos técnicos.
- Auto-resume de sesiones después de cierre.

### Cloud
- Sandboxes con setup.sh más rápido (caching agresivo de deps).
- Logs en vivo con búsqueda.
- Branches autogenerados con plantilla configurable.

### Integraciones nuevas
- Linear y Jira (sync bidireccional).
- Slack slash commands más completos.
- Vercel/Netlify para deploy previews.

### Seguridad
- Audit logs exportables vía API.
- Sandbox networking con allowlist granular.
- Data residency configurable (US, UE) en Enterprise.

### CLI
- `codex apply` para aplicar patches generados en Cloud.
- `--json` para output parseable.
- Soporte mejorado para HTTPS_PROXY.

## Cómo seguir el changelog en tiempo real

- **Suscriptores de la guía**: newsletter mensual con cambios.
- **Status oficial**: `status.openai.com`.
- **Release notes**: `platform.openai.com/docs/codex/changelog`.

## Cómo aplicar actualizaciones a la guía

Cuando OpenAI rompe algo (rara vez), los capítulos afectados se marcan con un banner "actualizado"
y mantenemos el contenido viejo accesible por si estás en la versión anterior.

> ¿Detectaste algo desactualizado? Escribinos por `/aportar/` y lo corregimos en la próxima edición.
