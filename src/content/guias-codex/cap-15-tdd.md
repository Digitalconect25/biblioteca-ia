---
titulo: Flujo TDD con Codex
parte: Flujos de Trabajo Reales
n: 15
tipo: capitulo
resumen: "TDD automatizado — Codex escribe el test primero, luego el código, luego el refactor. Ejemplo end-to-end, trampas comunes (tests malos, código que pasa pero está mal, mock excesivo)."
objetivos:
  - Aplicar TDD con Codex en un caso real.
  - Detectar tests mal diseñados antes de aceptarlos.
  - Evitar la trampa del "código pasa pero está mal".
actualizado: 2026-05-30
---

TDD con Codex no es teoría: es **el modo más rentable** de delegar features. El bucle queda:

1. Vos describís el comportamiento deseado en lenguaje natural.
2. Codex escribe **primero el test** (que debe fallar).
3. Codex escribe la **implementación mínima** para que pase.
4. Codex propone **refactor** si el código quedó feo.

Ese orden importa: si dejás que escriba primero el código, el test que después agregue va a estar
"cómodo" con esa implementación (y no probará lo importante).

## Prompt template

> "Quiero una función `calcularDescuento(precio, cantidad, codigoCupon)` que devuelva el precio
> final aplicando el descuento por cantidad (10% si >5 unidades) y el descuento del cupón. Si el
> cupón es inválido, ignora el cupón pero no falla. **Empezá escribiendo los tests con todos los
> casos borde, después la implementación**."

Codex empieza por el test:

```ts
describe('calcularDescuento', () => {
  it('aplica descuento por cantidad solo a 6+ unidades', () => { ... });
  it('aplica cupón DESCUENTO20 con 20% extra', () => { ... });
  it('ignora cupón inválido sin fallar', () => { ... });
  it('descuento total nunca pasa el 50%', () => { ... });
});
```

Después la implementación que hace pasar esos tests.

## Trampas comunes

### 1. Tests débiles
Si pedís "agregá tests", Codex puede generar tests que solo verifican que la función "no tira error".
Solución: pedile **casos borde explícitos** y revisá los `expect`. Un test que solo hace
`expect(fn()).toBeDefined()` no testea casi nada.

### 2. Código que pasa pero está mal
A veces, para hacer pasar tests débiles, Codex hard-codea valores. Solución: pedile tests con **al
menos 2 entradas distintas** que demuestren la lógica.

### 3. Mock excesivo
Para acelerar tests, Codex puede mockear medio mundo. Resultado: tests pasan pero la integración
real falla. Solución: pedí explícitamente "mocká solo X, lo demás real" o "tests de integración,
no unitarios".

### 4. Coverage como métrica única
Codex puede subir coverage sin probar nada útil. La coverage es un piso, no un techo. Mirá la
calidad de los tests, no solo el %.

## Mini-ejemplo de la trampa

Imaginemos: pedís "función `esEmailValido(email)`, con tests". Codex puede entregar:

```ts
function esEmailValido(email) { return email.includes('@'); }
test('valida emails', () => {
  expect(esEmailValido('hola@example.com')).toBe(true);
});
```

Pasa el test, "está cubierto", pero la función NO valida emails. Solución: en el prompt poné los
casos que importan:

> "Tests: debe aceptar `a@b.co`, rechazar `a@@b.co`, rechazar `a@b` (sin TLD), rechazar `@b.com`,
> rechazar string vacío."

Con casos explícitos, Codex hace bien la implementación.

## El TDD con Codex es un superpoder

Bien usado, te da **especificación + tests + implementación** en una sola task. La trampa es no
revisar los tests. Si hacés eso, en 3 meses tu codebase pasa de "no testeado" a "testeado en serio".
