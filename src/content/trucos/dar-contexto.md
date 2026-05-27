---
titulo: Dale contexto antes de pedir
nivel: principiante
resumen: Decile a la IA qué rol cumple, cuál es el objetivo y para quién es; las respuestas mejoran muchísimo.
descripcion: >
  El error más común es pedir algo "en seco". La IA no sabe tu situación. Si le das un rol
  ("actuá como profesor de matemática"), el objetivo ("explicá para alguien que recién
  empieza") y el público, la respuesta se vuelve mucho más útil y precisa. Tres líneas de
  contexto valen más que un prompt largo y vago.
herramienta: ChatGPT / Claude / Gemini
ejemplo: |
  Actuá como un profesor de matemática paciente.
  Explicá qué es una fracción a un niño de 10 años,
  con un ejemplo de la vida real y sin tecnicismos.
tags: [prompting, basico, contexto]
actualizado: 2026-05-27
---

Cuando le pedís algo "en seco", la IA tiene que adivinar quién sos, para qué lo necesitás y a qué nivel responder. Y adivina mal: te devuelve algo genérico, demasiado técnico o demasiado básico, y terminás reescribiendo el pedido tres veces. El contexto evita ese ida y vuelta. Tres líneas que dicen quién, para quién y para qué orientan toda la respuesta desde el primer intento.

## Cómo aplicarlo

1. **Dale un rol.** "Actuá como nutricionista", "como abogado laboral", "como profesor de primaria". El rol activa el vocabulario y el criterio correctos.
2. **Definí el objetivo.** Qué querés lograr: explicar, convencer, resumir, decidir. No es lo mismo "explicame el IVA" que "ayudame a decidir si me conviene ser monotributista".
3. **Aclará para quién es.** Un niño, un cliente, tu jefe, vos mismo. El público define el tono y la profundidad.
4. **Sumá restricciones si importan.** Largo, tono, idioma, qué evitar. "En 5 líneas", "sin tecnicismos", "en español rioplatense".

## Antes y después

Pedido vago:

```
Explicame qué es el interés compuesto.
```

Con contexto:

```
Actuá como profesor de finanzas personales, paciente y claro.
Explicale qué es el interés compuesto a alguien de 16 años
que nunca ahorró. Usá un ejemplo con plata real y montos chicos.
Máximo 6 líneas, sin fórmulas.
```

## Llevalo más lejos

- **Pedile que te pregunte.** Cerrá con "antes de responder, haceme las preguntas que necesites para darme la mejor respuesta". La IA detecta qué le falta saber.
- **Pegá material de referencia.** Sumá un texto, una conversación previa o un ejemplo de tu trabajo para que copie tu estilo y tu contexto real.
- **Guardá tu contexto fijo.** Si siempre trabajás desde el mismo rol o proyecto, ponelo en las instrucciones personalizadas de la IA y no lo repetís más.
