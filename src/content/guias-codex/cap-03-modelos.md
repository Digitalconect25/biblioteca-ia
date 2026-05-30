---
titulo: Los Modelos de Codex
parte: Mundo Codex
n: 3
tipo: capitulo
resumen: "Modelos disponibles en mayo 2026, capacidades, velocidad, costo, límites de contexto y cuándo conviene cambiar entre ellos en plena tarea."
objetivos:
  - Conocer el catálogo de modelos que Codex puede usar.
  - Elegir el modelo correcto por costo, velocidad y profundidad.
  - Cambiar de modelo a mitad de una tarea sin perder contexto.
actualizado: 2026-05-30
---

Codex no es un solo modelo, es una **familia**. Cuando configurás un proyecto o lanzás una task, elegís
con cuál corre. La elección impacta tres cosas: **costo, velocidad y profundidad de razonamiento**.

## El catálogo a alto nivel (mayo 2026)

OpenAI suele tener tres niveles activos en simultáneo. Los nombres exactos cambian seguido (ver
apéndice E para el changelog). Lo importante son las categorías:

- **Modelo rápido (mini/nano)** — barato y veloz, ideal para tareas chicas, autocompletado, drafts,
  documentación y refactors mecánicos.
- **Modelo balanceado** — el "todo terreno" para uso diario: lee bien un repo mediano, razona pasos,
  cuesta moderado.
- **Modelo reasoner / pro** — el caro y profundo, optimizado para arquitectura, depuración compleja,
  decisiones que requieren pensar varios pasos en serie. Lento y caro pero precisa.

A esto se suman **modos**: la mayoría de modelos modernos tienen un toggle de "thinking on/off". Con
thinking activado el modelo razona más antes de responder (más tokens, mejor calidad). Sin él, va más
rápido y barato.

## Capacidades que mirar

Cuando elijas modelo, comparalo en estos 4 ejes:

1. **Ventana de contexto** — cuánto puede leer de una vez. Para refactors grandes querés 200k+
   tokens; para bug fix puntual con 32k alcanza.
2. **Profundidad de razonamiento** — el reasoner abre el diff y se da cuenta de que un cambio rompe
   un test que ni siquiera está en el archivo que tocaste. El mini, no siempre.
3. **Velocidad de salida** — tokens por segundo. Importa mucho en interactivo (IDE, chat), poco en
   Cloud (donde te vas y volvés).
4. **Costo** — por token de entrada y de salida. El reasoner puede ser 5-10x más caro que el mini.

## Una regla simple para elegir

| Tipo de tarea | Modelo |
|---|---|
| Autocompletar, drafts, comentarios | rápido |
| Día a día (escribir, ajustar, tests) | balanceado |
| Arquitectura, bug enredado, refactor grande | reasoner / pro |
| Trabajo en lote en Cloud (1000 archivos) | balanceado o reasoner según calidad necesaria |

## Cambiar de modelo a mitad de la tarea

Codex permite cambiar el modelo en el medio de una task sin perder el contexto de la sesión. Patrones
útiles:

- **Empezás con reasoner para el plan**, después bajás a balanceado para ejecutar. Pensar caro, hacer
  barato.
- **Si una task se traba** (el modelo da vueltas), subí un escalón. A veces el problema no es el
  prompt, es la profundidad de razonamiento.
- **Si pagás más de lo que esperabas**, bajá un escalón. Muchas tareas no necesitan el reasoner.

## Tokens, no minutos

Los costos de Codex se miden en tokens (entrada + salida), no en tiempo. Por eso:

- Un AGENTS.md largo le suma costo a CADA task (lee siempre el archivo).
- Un prompt vago hace que el modelo pida aclaraciones, multiplicando idas y vueltas.
- Pedir "explicá tu razonamiento" en cada paso multiplica los tokens. Útil para auditar, caro para
  rutina.

## Antipatrones a evitar

- **Usar siempre el más caro "por las dudas"**: vacía el presupuesto sin ganar calidad real.
- **Saltar de modelo sin necesidad**: cambiar al rápido a mitad de un plan caro hace que pierda
  precisión.
- **No mirar el contador de tokens**: en Cloud, una task mal acotada puede consumir 500k tokens en
  iteraciones.

## Resumen

Pensá los modelos como una **caja de herramientas**, no como uno solo. El truco está en empezar
seleccionando el modelo más barato que pueda hacer la tarea bien, y subir solo si no alcanza.
