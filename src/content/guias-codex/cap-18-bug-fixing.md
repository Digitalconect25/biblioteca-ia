---
titulo: Flujo de Bug Fixing con Repros
parte: Flujos de Trabajo Reales
n: 18
tipo: capitulo
resumen: "Pipeline de bugs — reporte con screenshot/log → Codex genera repro test fallido → arregla el bug → test pasa → PR. Cuándo Codex falla (race conditions, memory leaks) y cuándo el debug humano es esencial."
objetivos:
  - Convertir reportes de bug en PRs reproducibles automáticamente.
  - Saber cuándo NO delegar el debug a Codex.
actualizado: 2026-05-30
---

El pipeline ideal de bug fixing con Codex tiene un orden estricto:

1. **Repro** (test que falla).
2. **Diagnóstico** (entender por qué).
3. **Fix** (cambio mínimo).
4. **Validación** (test pasa, ningún otro test rompe).
5. **PR** con todo lo anterior.

Codex puede hacer los 5 pasos. La clave está en el primero: **siempre el test del repro primero**.

## Por qué el repro primero

Sin un test fallido, no hay forma objetiva de saber:

- Si el bug existe realmente.
- Si el fix lo arregla.
- Si vuelve a aparecer en el futuro.

Pedile a Codex:

> "Acá el reporte de bug: [descripción + log + screenshot]. Antes de arreglarlo, escribí un test
> que **falle** demostrando el bug. NO escribas el fix todavía. Mostrame el test y confirmame que
> falla en el estado actual del repo."

Cuando confirma que falla, le decís: "ahora arreglá el bug, sin tocar otros archivos. El test debe
pasar y todos los demás tests también deben seguir pasando."

## Cuándo Codex se equivoca al debuguear

### Race conditions
Codex no ejecuta carga real ni simula concurrencia bien. Si el bug solo aparece con 100 requests
paralelas, no lo va a reproducir mirando el código. Necesitás un test de carga real o un
diagnóstico humano.

### Memory leaks
Difíciles de ver en una sesión. Codex puede sospechar de un closure, pero confirmar requiere
heap snapshots y observación en producción.

### Bugs de UI con CSS roto
Codex no "ve" la pantalla salvo que le pases screenshots. Aun así, CSS de cascada y especificidad
son terreno complicado: a veces propone soluciones que rompen otros lugares.

### Bugs intermitentes ("flaky")
Si el bug aparece 1 de cada 50 veces, Codex puede "arreglarlo" agregando un retry que esconde la
causa real. Cuidado.

## Mini ejemplo end-to-end

**Reporte**: "El total del carrito se calcula mal cuando hay 6+ items con un cupón."

Task:
> "Bug: si hay 6+ items y aplicás cupón DESCUENTO20, el total queda 4% más bajo de lo esperado.
> Adjunto screenshot del flujo. Primero escribime un test que falle reproduciendo el caso. Después
> arreglalo."

Codex propone un test:

```ts
it('aplica cupón después del descuento por cantidad', () => {
  const total = calcularTotal({ items: 6, precio: 100, cupon: 'DESCUENTO20' });
  // Esperado: 100*6 = 600 - 10% cantidad = 540 - 20% cupón = 432
  expect(total).toBe(432);
});
```

Corre, falla (da 460 en el código actual). Aprobás. Codex va a la implementación, ve que el cupón se
aplicaba antes del descuento por cantidad, lo invierte. Test pasa. PR listo.

## Anti-patrón

"Codex, arreglá este bug." Sin repro, Codex va a editar partes del código que "parecen relacionadas"
y a veces queda peor que antes. Siempre repro primero.
