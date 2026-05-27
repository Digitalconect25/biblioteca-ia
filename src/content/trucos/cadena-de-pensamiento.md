---
titulo: Pedí que piense paso a paso
nivel: intermedio
resumen: "Para problemas que requieren razonar, pedile a la IA que piense paso a paso antes de responder. Acierta mucho más."
descripcion: >
  La cadena de pensamiento (chain of thought) consiste en pedirle a la IA que razone en voz
  alta antes de dar la respuesta final. Al obligarla a mostrar los pasos, comete menos errores
  en cuentas, lógica y decisiones con varias variables. Es una de las técnicas más potentes
  para tareas que no se resuelven de un saque.
herramienta: Todas las IAs
ejemplo: |
  Tengo que repartir 47 sillas en filas de 6 sin que sobre ninguna.
  Pensá el problema paso a paso antes de darme la respuesta final.
  Mostrá tu razonamiento y al final escribí "Respuesta:".
tags: [prompting, razonamiento, chain-of-thought]
actualizado: 2026-05-28
---

Cuando le pedís a la IA la respuesta directa a un problema con varios pasos (una cuenta, una decisión con condiciones, un análisis), suele tirar lo primero que "suena bien" y se equivoca. Pedirle que piense paso a paso la fuerza a desarmar el problema antes de concluir, igual que cuando vos hacés las cuentas en un papel en lugar de adivinar. Ese razonamiento intermedio reduce los errores y, de paso, te deja ver dónde se equivocó si algo no cierra.

## Cómo aplicarlo

1. **Pedilo explícito.** Agregá "pensá paso a paso" o "razoná antes de responder". Es el gatillo de la técnica.
2. **Separá razonamiento de respuesta.** "Mostrá tu razonamiento y al final escribí Respuesta:". Así obtenés ambas cosas ordenadas.
3. **Usalo cuando hay varios pasos.** Cuentas, lógica, comparar opciones, planificar. Para preguntas simples no hace falta.
4. **Revisá los pasos, no solo el final.** Si el resultado te suena raro, leé el razonamiento: ahí se ve el error.

## Antes y después

Pidiendo la respuesta directa:

```
Si un producto cuesta 1200 y le aplico 15% de descuento
y después 21% de IVA, ¿cuánto pago?
```

Pidiendo razonamiento paso a paso:

```
Si un producto cuesta 1200, le aplico 15% de descuento
y después 21% de IVA sobre el precio ya rebajado,
¿cuánto pago? Resolvé paso a paso, mostrando cada cálculo,
y al final escribí "Total a pagar:".
```

## Llevalo más lejos

- **Ejemplos con razonamiento.** Combiná con few-shot: mostrá un caso resuelto paso a paso para que copie ese estilo de pensar.
- **Pedile que verifique.** Cerrá con "ahora revisá tu propio razonamiento y corregí si encontrás un error".
- **Modelos de razonamiento.** Algunas IAs ya razonan solas; aun así, pedir el paso a paso explícito ayuda en los casos difíciles.
