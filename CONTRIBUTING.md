# Cómo aportar a Biblioteca IA

¡Gracias por sumar! La biblioteca crece con aportes de la comunidad.

## Pasos

1. Hacé un **fork** del repositorio.
2. Elegí el tipo de ficha y copiá la plantilla correspondiente desde `plantillas/`:
   - Skill → `plantillas/ficha-skill.md` → guardar en `src/content/skills/`
   - MCP → `plantillas/ficha-mcp.md` → guardar en `src/content/mcps/`
   - IA → `plantillas/ficha-ia.md` → guardar en `src/content/ias/`
3. **El nombre del archivo es el identificador** (el slug). Ej: `claude-code.md` → `/skills/claude-code/`.
   Usá minúsculas y guiones, sin espacios ni acentos.
4. Completá los campos (ver abajo) y escribí en español claro.
5. Abrí un **Pull Request**. La validación automática (GitHub Actions) revisa el formato.
   Si algo está mal, el mensaje te dice qué corregir.

## Reglas de contenido

- **Estable vs. volátil:** lo que cambia seguido (precios, límites de planes, nombre del
  modelo del mes) **no se copia**: se enlaza a la fuente oficial. La ficha describe lo
  estable (qué es, cómo funciona, cómo se accede en general).
- Poné `revisarAntesDe` (una fecha unos meses adelante). Pasada esa fecha, la ficha muestra
  un aviso de "puede estar desactualizada".
- `nivel` debe ser exactamente: `principiante`, `intermedio` o `avanzado`.
- `resumen`: máximo 200 caracteres, una frase que diga qué es y para qué.

## Campos por tipo

- **Comunes:** `titulo`, `nivel`, `resumen`, `descripcion`, `gratis`, `ejemplo` (opcional),
  `enlaces` (opcional), `tags` (opcional), `actualizado`, `revisarAntesDe` (opcional).
- **Skill:** + `categoria` (opcional), `comoUsar`, `comoAcceder`.
- **MCP:** + `funciones`, `comoConectar`, `ejemploConfig` (opcional).
- **IA:** + `funciones`, `comoAcceder`, `planPago` (opcional), `casosDeUso`.

## Desarrollo local

```bash
npm install
npm run dev
npm run build   # valida el esquema y genera el índice de búsqueda
```

Si `npm run build` pasa, tu ficha está bien formada.
