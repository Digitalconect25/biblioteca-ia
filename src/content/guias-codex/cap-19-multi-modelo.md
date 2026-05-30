---
titulo: 'Multi-Modelo: Cuándo Cambiar Entre Modelos'
parte: Flujos de Trabajo Reales
n: 19
tipo: capitulo
resumen: "Selección de modelo por tarea — reasoner caro para arquitectura compleja, modelo rápido para trabajo repetitivo, balanceado para uso diario. Costo vs velocidad vs calidad."
objetivos:
  - Tener un mapa mental de qué modelo usar por tipo de tarea.
  - Cambiar de modelo en plena task sin perder contexto.
  - Controlar costos sin sacrificar calidad donde importa.
actualizado: 2026-05-30
---

Codex permite elegir modelo por task. Aprender a elegir bien es la diferencia entre **gastar
inteligente** y **gastar como si fuera gratis** (no lo es).

## Mapa por tipo de tarea

| Tarea | Modelo recomendado |
|---|---|
| Autocompletar líneas | Rápido (mini) |
| Agregar tests obvios | Rápido o Balanceado |
| Refactor mecánico (renombrar, mover) | Rápido o Balanceado |
| Agregar feature CRUD nueva | Balanceado |
| Bug fix con repro claro | Balanceado |
| Refactor que toca arquitectura | Reasoner |
| Diseño de API nuevo | Reasoner |
| Decisiones de modelado de datos | Reasoner |
| Investigación de bug complejo | Reasoner |
| Migraciones grandes | Balanceado (con plan armado por Reasoner) |

## Patrón "pensar caro, hacer barato"

Para una tarea grande:

1. **Reasoner** para el plan: "diseñá la migración paso a paso".
2. Vos revisás y aprobás el plan.
3. **Balanceado** para ejecutar cada paso del plan: ya no necesita pensar, solo ejecutar.

Resultado: pagás reasoner solo por el ~10% del costo total (el planning), el resto va más barato.

## Cambiar de modelo en medio de la task

Dos formas:

- En la UI de la task: dropdown "Cambiar modelo" → seguís en la misma conversación.
- En la CLI: `codex model <nombre>` en medio de una sesión interactiva.

El contexto leído hasta ese momento se mantiene; cambia solo el motor.

## Cuándo escalar (subir de modelo)

- La task lleva 3+ iteraciones dando vueltas sin progreso.
- Codex pide "más contexto" o dice "no estoy seguro".
- El diff propuesto rompe tests y no se da cuenta.

Subir un escalón suele destrabar.

## Cuándo bajar (cobrar menos)

- La task es repetitiva (renombrar variables, mover archivos).
- El alcance es chico (un archivo, una función).
- Estás en interactivo y la latencia importa más que la profundidad.

## Anti-patrón: "el más caro siempre"

Si dejás el reasoner como default, vas a pagar 5-10x más para tareas donde el balanceado funciona
igual. La mayoría de tu día son tareas balanceadas-o-menos.

## Anti-patrón opuesto: "el más barato siempre"

Si usás el mini para arquitectura, vas a recibir respuestas plausibles pero malas. Reescribir el
trabajo te sale más caro que el reasoner desde el principio.

## Tip de medición

En el dashboard de Codex podés ver el costo por task. Una vez al mes mirá:

- ¿Cuántas tasks usaron reasoner y cuántas balanceado?
- ¿Cuáles fueron las 5 más caras y se justificaron?
- ¿Hay tasks repetitivas en reasoner que podrían ser balanceado?

Ajustás los defaults por proyecto en `AGENTS.md` y mes a mes el costo baja sin perder calidad.
