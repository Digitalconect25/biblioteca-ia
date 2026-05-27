---
titulo: Iterá; no empieces de cero cada vez
nivel: intermedio
resumen: En vez de reescribir todo el pedido, decile qué ajustar de la respuesta anterior.
descripcion: >
  La IA recuerda la conversación. Aprovechalo: si algo casi sale, no rehagas el prompt entero;
  pedí cambios concretos sobre lo que ya dio ("más corto", "más formal", "cambiá solo el
  título"). Iterar en pasos chicos llega a un mejor resultado que tirar prompts gigantes de cero.
herramienta: ChatGPT / Claude / Gemini
ejemplo: |
  Está muy bien, pero hacé tres cambios:
  1) más corto (la mitad),
  2) tono más informal,
  3) dejá el ejemplo final tal cual está.
tags: [prompting, iteracion, edicion]
actualizado: 2026-05-27
---

El error típico es que la respuesta sale casi bien, algo no te cierra, y reescribís el prompt entero desde cero. Resultado: perdés lo bueno que ya tenías y la IA empieza de nuevo. Como recuerda toda la conversación, conviene tratar la primera respuesta como un borrador vivo y pedir ajustes puntuales sobre lo que ya dio. Iterar en pasos chicos llega más lejos que tirar prompts gigantes una y otra vez.

## Cómo aplicarlo

1. **Rescatá lo que sirve.** Empezá por "esto está bien" y aclará qué parte querés conservar tal cual.
2. **Pedí cambios concretos y separados.** "Más corto", "tono más formal", "cambiá solo el título". Un cambio por instrucción es más fácil de controlar.
3. **Protegé lo bueno explícitamente.** Si algo no querés que toque, decilo: "dejá el ejemplo final igual".
4. **Si se desvió mucho, volvé atrás.** "Tomá la versión anterior, no la última" te devuelve al punto bueno sin recomenzar.

## Antes y después

Empezando de cero:

```
(borrás todo y reescribís el prompt original con un par
de palabras distintas, esperando que esta vez salga)
```

Iterando sobre lo que ya salió:

```
Está muy bien. Hacé tres cambios y nada más:
1) la mitad de largo,
2) tono más informal,
3) dejá el ejemplo final tal cual está.
```

## Llevalo más lejos

- **Pedí variantes en paralelo.** "Dame tres versiones del título con tonos distintos" y elegís, en vez de iterar de a una.
- **Usá la IA como editora.** Pegá tu propio texto y pedí cambios específicos: recortar, subir el ritmo, sacar repeticiones.
- **Guardá versiones.** Cuando una salga muy bien, copiala aparte antes de seguir iterando, así no la perdés si los cambios siguientes empeoran el resultado.
