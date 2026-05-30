---
titulo: 'Instalar Codex: Desktop, Móvil, Web y Terminal'
parte: Mundo Codex
n: 4
tipo: capitulo
resumen: "Instalación paso a paso en las 6 superficies. Troubleshooting incluido para los errores más típicos de auth y red."
objetivos:
  - Tener Codex funcionando en al menos 3 superficies en menos de 30 minutos.
  - Resolver los errores más comunes de instalación y auth.
  - Entender cómo se sincronizan las superficies entre sí.
actualizado: 2026-05-30
---

Todas las superficies usan la **misma cuenta de ChatGPT** y se sincronizan automáticamente. Vas a
poder lanzar una task en el celular, verla progresar en el desktop y abrir el PR desde la web sin
tocar nada extra. Empezá por la que más uses; el resto se suma de a poco.

## 1. App de ChatGPT en escritorio (macOS y Windows)

1. Bajá ChatGPT desde **chatgpt.com/download** (no de tiendas no oficiales).
2. Instalá normal. En macOS pedirá permisos para Acceso a Pantalla (screenshots) y Atajos del sistema:
   aceptá ambos si querés usar el "hot corner" y la captura inteligente.
3. Iniciá sesión con tu cuenta. Si tenés ChatGPT Plus/Pro/Team/Enterprise, Codex ya viene activado.
4. Abrí el panel lateral (Cmd/Ctrl + K) y buscá "Codex". Vas a ver el dashboard de tasks.

**Si no aparece Codex**: confirmá tu plan (Plus mínimo) y reiniciá la app.

## 2. Apps móviles (iOS y Android)

- **iOS**: App Store → "ChatGPT" (la oficial, de OpenAI). En la pestaña inferior aparece Codex.
- **Android**: Google Play → mismo nombre.
- Permisos: notificaciones (para los push de tasks terminadas), micrófono (dictado) y cámara/galería
  (para subir screenshots).

## 3. Web (chatgpt.com/codex)

Cero instalación. Entrás con tu cuenta a `chatgpt.com/codex`. Conectás tu GitHub (paso obligatorio
para repos privados) y ya podés lanzar tasks contra cualquier repo autorizado.

## 4. Codex Cloud

Está integrada en la web. No es una instalación separada: cuando lanzás una task en `chatgpt.com/codex`
con la opción **"Run in Cloud"**, ya estás ahí. La diferencia con local es que la sandbox la pone
OpenAI y la tarea corre incluso si cerrás el navegador.

## 5. Extensiones IDE

### VS Code (y Cursor, que es un fork)
- Marketplace → buscá "OpenAI Codex" (publisher OpenAI).
- Instalalo, recargá la ventana.
- `Cmd/Ctrl+Shift+P` → "Codex: Sign in". Te abre el navegador para autorizar.

### JetBrains (IntelliJ, PyCharm, WebStorm, GoLand, etc.)
- Settings → Plugins → marketplace → "OpenAI Codex".
- Reiniciá. En la barra lateral aparece el panel "Codex".

## 6. CLI (`codex`)

Es el más versátil para CI y scripting.

```bash
# macOS / Linux
brew install openai/tap/codex
# o
npm i -g @openai/codex

# Verificar
codex --version
codex login
```

Después de `codex login` te abre el navegador para autorizar. La sesión se guarda en
`~/.codex/credentials` (no la subas a Git).

## Troubleshooting

### "Login falla / loop infinito"
- Borrá las cookies de `chatgpt.com`.
- Probá desde una ventana incógnita y volvé a `codex login` o re-auth en la extensión.

### "No veo Codex aunque tengo ChatGPT Plus"
- Cerrá sesión y volvé a entrar.
- Verificá la región: en algunos países Codex llegó con retraso.
- Actualizá la app (las versiones viejas no traen el panel).

### "Cloud no inicia"
- Revisá que tengas GitHub conectado.
- Que el repo elegido esté autorizado para Codex.
- Que el branch base exista (a veces apunta a `main` por defecto y el repo usa `master`).

### "La extensión se queda colgada"
- Mirá los logs: VS Code → Output → "Codex".
- Reauth si dice "token expired".

### "El CLI pide login en cada comando"
- Verificá permisos del archivo: `chmod 600 ~/.codex/credentials`.
- En CI usá el flag `--api-key $OPENAI_API_KEY` en vez de `login`.

## Sincronización entre superficies

- Las tasks se ven en todas las superficies al toque (Codex Cloud y la web son la fuente).
- Los **archivos** los lee Codex en cada superficie de forma independiente: en el desktop lee tu repo
  local, en Cloud lee la copia que se clonó en la sandbox. No es magia: si cambiaste algo localmente
  y todavía no lo pusheaste, Cloud no lo ve.
- La configuración (modelo por defecto, modo de aprobación) se guarda **por proyecto en `AGENTS.md`**
  y por cuenta en settings (ver Apéndice B).

Listo. Si tenés esto andando, ya tenés más herramienta de la que la mayoría de devs explora.
