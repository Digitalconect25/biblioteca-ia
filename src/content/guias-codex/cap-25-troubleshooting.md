---
titulo: Troubleshooting y Mejores Prácticas
parte: Avanzado
n: 25
tipo: capitulo
resumen: "Errores comunes y soluciones (app no abre, login falla, Cloud no inicia, GitHub no conecta, modelo lento, costos descontrolados), rate limiting, optimización, antipatrones, recursos de soporte."
objetivos:
  - Resolver los problemas más comunes en minutos.
  - Identificar antipatrones que pagás caro sin darte cuenta.
  - Saber dónde buscar ayuda cuando algo escala.
actualizado: 2026-05-30
---

Esta es la chuleta para los días raros.

## Errores comunes

### "App no abre"
- macOS: System Settings → Privacy & Security → permitir la app si quedó bloqueada por Gatekeeper.
- Windows: ejecutar como admin la primera vez. Si crashea inmediato, borrar `%AppData%\ChatGPT`.

### "Login falla / loop"
- Borrá cookies de `chatgpt.com`.
- Probá login desde incógnito.
- Verificá que tu plan tiene acceso (Plus mínimo).

### "Cloud no inicia"
- Repo no autorizado: Settings → Connections → GitHub → re-autorizar org.
- Branch base no existe: revisa que el branch que elegiste exista en el repo.
- Quota llena: revisá Cloud quota en el dashboard.

### "GitHub no conecta"
- Si es una org: el admin de la org debe aprobar OpenAI Codex App.
- Revoke + reauth si los permisos quedaron viejos.

### "Modelo lento"
- Posible alta demanda (modelos caros suelen ser más lentos en horarios pico).
- Bajá a balanceado para tareas que no requieren reasoner.
- Verificá que tu prompt no esté pidiendo "razoná paso a paso" innecesariamente.

### "Costos descontrolados"
- Mirá el dashboard de costos por task.
- Identificá las 5 más caras.
- Patrón típico: AGENTS.md gigante o prompts que disparan muchas iteraciones.

## Rate limiting

Si te aparece `429: rate limited`:

- En tareas chicas, reintenta con backoff (la app lo hace solo).
- En CI, bajá la frecuencia o usá API key con cuota mayor.
- Si pegás el límite todo el día, considerá upgrade de plan.

## Optimización

### Bajar costo por task

- Ajustá `AGENTS.md`: <500 líneas en total.
- Prompts específicos: "Modificá solo `users.ts`, no toques otros archivos."
- Modelo correcto: no uses reasoner para tareas simples.
- Usar caching: en Cloud, mantené `lockfile` estable para no reinstalar deps cada vez.

### Acelerar respuesta

- Reducí contexto: si el repo es enorme, ignorá folders en `.codexignore`.
- Sesiones cortas: cerrá una sesión al terminar (las largas acumulan contexto que pagás).

## Antipatrones más comunes

1. **Tareas vagas**: "mejorá esto" → diff caótico. Sé específico.
2. **Auto-approve en producción**: nunca. Siempre review humana.
3. **Pegar secrets en chat**: nunca. Rotalos si pasó.
4. **Usar reasoner para todo**: paga más sin ganar calidad.
5. **No tener AGENTS.md**: repetís el mismo contexto en cada task.
6. **No revisar diffs grandes**: terminás aceptando bugs.

## Recursos de soporte

- **Docs oficiales**: `platform.openai.com/docs/codex` (la fuente).
- **Community Forum**: `community.openai.com`.
- **Status page**: `status.openai.com` (cuando algo no funciona, mirá acá primero).
- **GitHub de openai/codex** (CLI, ejemplos).
- **Soporte directo**: Plus/Pro vía web, Enterprise con account manager.

## Cierre

Si llegaste hasta acá, ya tenés todo lo necesario para usar Codex en serio. El resto es práctica:
**lanzá 10 tasks reales esta semana**. Vas a equivocarte con varias, calibrar los prompts, ajustar
`AGENTS.md`, y para la semana 3 vas a delegar cosas que antes te llevaban un día.

Codex no reemplaza tu criterio. Lo amplifica.
