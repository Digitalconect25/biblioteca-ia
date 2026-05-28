---
titulo: Mandá tu primer mensaje con la WhatsApp Cloud API de Meta
nivel: avanzado
herramienta: Meta for Developers + WhatsApp Cloud API
tiempo: 30 min
resumen: "Creá una app en Meta, agregá WhatsApp, usá el número de prueba y enviá tu primer mensaje con la API oficial."
descripcion: >
  Tutorial paso a paso para enviar tu primer mensaje de WhatsApp con la Cloud API oficial de
  Meta, sin intermediarios ni código de servidor. Creás una app en Meta for Developers, le
  agregás el producto WhatsApp, usás el número de prueba y el token temporal, y disparás el
  mensaje con un request HTTP.
objetivo: Dejar enviado tu primer mensaje de WhatsApp con la API oficial de Meta usando el número y el token de prueba.
requisitos:
  - Una cuenta de Facebook/Meta para entrar a Meta for Developers
  - Un teléfono con WhatsApp para recibir el mensaje de prueba
  - Una terminal con curl (o un cliente HTTP como Postman)
  - Nociones básicas de requests HTTP (headers, JSON)
pasos:
  - titulo: "1. Creá una app en Meta for Developers"
    detalle: "Entrá a developers.facebook.com, iniciá sesión y creá una app nueva de tipo Business. Esta app va a alojar el producto de WhatsApp."
  - titulo: "2. Agregá el producto WhatsApp"
    detalle: "Dentro de la app, agregá el producto WhatsApp. Meta te crea automáticamente un número de prueba y una cuenta de WhatsApp Business asociada para que pruebes sin dar de alta un número real."
  - titulo: "3. Copiá el Phone Number ID y el token temporal"
    detalle: "En la sección de inicio rápido de la API vas a ver el ID del número de teléfono (Phone Number ID) y un token de acceso temporal. El token temporal sirve para probar y vence en unas horas."
    comun: "Anotá el Phone Number ID y el token; los vas a usar en el request."
  - titulo: "4. Agregá tu número como destinatario de prueba"
    detalle: "En la misma pantalla, cargá tu propio número de WhatsApp como destinatario de prueba. Meta solo deja enviar a números verificados mientras estás en modo de prueba."
  - titulo: "5. Enviá el mensaje con la API"
    detalle: "Reemplazá PHONE_NUMBER_ID, ACCESS_TOKEN y el número de destino (formato internacional, sin signos) y corré el request. La versión del endpoint (v23.0 acá) va cambiando; usá la vigente que muestre la doc."
    comun: |
      curl -X POST \
        'https://graph.facebook.com/v23.0/PHONE_NUMBER_ID/messages' \
        -H 'Authorization: Bearer ACCESS_TOKEN' \
        -H 'Content-Type: application/json' \
        -d '{
          "messaging_product": "whatsapp",
          "to": "5491122334455",
          "type": "template",
          "template": { "name": "hello_world", "language": { "code": "en_US" } }
        }'
  - titulo: "6. Verificá la entrega"
    detalle: "Si el request devuelve un id de mensaje, debería llegarte el mensaje al WhatsApp del número que cargaste como destinatario de prueba."
enlaces:
  - texto: "Get Started - WhatsApp Cloud API (doc oficial)"
    url: https://developers.facebook.com/docs/whatsapp/cloud-api/get-started/
  - texto: "Enviar mensajes - Cloud API (doc oficial)"
    url: https://developers.facebook.com/docs/whatsapp/cloud-api/guides/send-messages/
tags: [whatsapp, automatizacion, cloud-api, meta, api, tutorial]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Al terminar vas a haber enviado tu primer mensaje de WhatsApp con la API oficial de Meta, usando el número de prueba y el token temporal. Es el punto de partida para automatizar de verdad: una vez que mandás un mensaje con un request, podés conectarlo a tu backend, a un bot o a un orquestador y armar flujos completos.

## Qué tener en cuenta

El primer mensaje conviene mandarlo como **plantilla** (en el ejemplo, la plantilla `hello_world` que Meta ya trae aprobada). Esto es porque WhatsApp impone la **ventana de 24 horas**: para iniciar una conversación, o para escribir fuera de las 24 horas desde el último mensaje del usuario, tenés que usar una plantilla aprobada, no texto libre. El texto libre solo funciona dentro de esa ventana, una vez que el usuario te escribió.

El **token temporal** vence rápido: sirve para esta prueba, pero para un servidor real necesitás un token permanente (System User). Y el **número de prueba** de Meta solo envía a destinatarios que cargaste y verificaste; no sirve para clientes reales. Para producción tenés que registrar tu propio número y verificar el negocio.

Sobre costos: Meta ofrece una capa de conversaciones gratuitas por mes y cobra por encima de ese tope. El esquema de precios cambia, así que confirmalo en la web oficial antes de calcular nada; no asumas un número.

## Si algo falla

- **El request devuelve error 190 o de token.** El token temporal venció (dura pocas horas). Volvé a la consola de la app y generá uno nuevo.
- **Error "recipient not in allowed list" o similar.** En modo de prueba solo se puede enviar a números cargados como destinatario de prueba. Agregá y verificá tu número en la pantalla de inicio rápido.
- **No llega el mensaje aunque el request salió bien.** Si usaste texto libre para iniciar la conversación, no va a entregarse: usá una plantilla aprobada (como `hello_world`) para el primer contacto.
- **Error de versión del endpoint.** La versión de la API (`v23.0` en el ejemplo) cambia con el tiempo. Revisá en la doc oficial cuál es la vigente y reemplazala en la URL.
- **Número de destino rechazado.** Tiene que ir en formato internacional sin "+", espacios ni guiones (por ejemplo, `5491122334455`).

## Siguiente nivel

- Generá un **token permanente** con un System User para que tu servidor pueda enviar sin que se venza.
- Configurá un **Webhook** (una URL pública con HTTPS) para recibir mensajes entrantes y estados de entrega, y así responder automáticamente.
- Creá tus propias **plantillas** y mandalas a aprobar para tus casos reales (avisos, OTP, seguimiento de pedidos).
- Registrá un **número propio** y verificá el negocio para pasar de prueba a producción.
- Conectá la API a un orquestador (n8n, Make) o a tu backend para armar bots y flujos completos.
