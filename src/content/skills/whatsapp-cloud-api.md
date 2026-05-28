---
titulo: WhatsApp Cloud API (Meta)
nivel: avanzado
categoria: whatsapp
resumen: "La API oficial de Meta para automatizar WhatsApp: enviás y recibís mensajes desde la nube de Meta, sin servidor propio ni intermediarios."
descripcion: >
  WhatsApp Cloud API es la vía oficial y directa de Meta (WhatsApp Business Platform) para
  automatizar mensajería con tus clientes. Corre sobre los servidores de Meta, así que no
  tenés que hostear nada. Mandás mensajes de texto, plantillas, multimedia e interactivos
  vía HTTP, y recibís eventos por Webhooks.
comoUsar: >
  Hacés un POST al endpoint /messages con tu token y el ID del número, y configurás un
  Webhook para recibir respuestas. Desde ahí armás flujos, bots y notificaciones conectando
  la API a tu backend o a un orquestador (n8n, Make, etc.).
comoAcceder: >
  Es gratis empezar. Creás una app en Meta for Developers, agregás el producto WhatsApp y
  obtenés un número de prueba con token temporal. Para producción registrás un número propio
  y verificás el negocio. Consultá precios actualizados en la web oficial.
gratis: true
enlaces:
  - texto: Documentación oficial (Cloud API)
    url: https://developers.facebook.com/docs/whatsapp/cloud-api/
  - texto: WhatsApp Business Platform
    url: https://business.whatsapp.com/products/business-platform
tags: [whatsapp, automatizacion, api, meta, cloud-api, webhooks]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

WhatsApp Cloud API es la puerta oficial de Meta para automatizar WhatsApp en un negocio. A diferencia de las plataformas que la revenden, acá hablás directo con la infraestructura de Meta: enviás mensajes con un request HTTP y recibís las respuestas por Webhook. Es la opción de menor costo por mensaje y máximo control, a cambio de que vos pongas el código y el servidor que recibe los Webhooks.

## Cómo empezar

1. Entrá a Meta for Developers y creá una app de tipo "Business".
2. Agregá el producto **WhatsApp** a la app. Meta te da un número de prueba y un Business Account de WhatsApp asociado.
3. Copiá el **ID del número de teléfono** (Phone Number ID) y generá un **token de acceso temporal** (sirve para probar; dura unas horas).
4. En la pantalla de inicio rápido podés cargar un número destino de prueba y mandar tu primer mensaje.
5. Configurá un **Webhook** (una URL pública tuya) para recibir mensajes entrantes y estados de entrega.
6. Para producción: registrá tu propio número, verificá el negocio y generá un **token permanente** (System User) para tu servidor.

## Ejemplo real

Enviar un mensaje de texto (reemplazá el ID del número, el token y el destinatario):

```bash
curl -X POST \
  'https://graph.facebook.com/v23.0/PHONE_NUMBER_ID/messages' \
  -H 'Authorization: Bearer ACCESS_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "messaging_product": "whatsapp",
    "recipient_type": "individual",
    "to": "5491122334455",
    "type": "text",
    "text": { "preview_url": false, "body": "Hola, te escribo desde la Cloud API." }
  }'
```

El número de destino va en formato internacional sin signos (E.164). La versión del endpoint (`v23.0` arriba) va cambiando; revisá en la doc oficial cuál es la vigente.

## Trucos y errores comunes

- **Ventana de 24 horas.** Para iniciar una conversación o escribir fuera de las 24 horas desde el último mensaje del usuario, tenés que usar una **plantilla** aprobada (no texto libre). El texto libre solo funciona dentro de esa ventana.
- **Capa gratuita.** Meta ofrece conversaciones gratuitas por mes; arriba de ese tope se cobra. El esquema de precios cambia con el tiempo: confirmalo siempre en la web oficial, no asumas un número.
- **Token temporal vs permanente.** El temporal vence rápido y sirve solo para pruebas. Para tu servidor necesitás un token permanente de System User.
- **Webhook con HTTPS válido.** Meta exige una URL pública con certificado válido y un token de verificación; si falla la verificación inicial no vas a recibir mensajes.
- **Plantillas con tiempo de aprobación.** Las plantillas pasan por revisión de Meta; dejá margen antes de un lanzamiento.

## Cuándo conviene

Conviene cuando tenés (o podés tener) un equipo técnico que arme el backend y los Webhooks, y querés el menor costo por mensaje y control total. Si en cambio buscás algo sin código, con bandeja de entrada y bot visual, mirá WATI o respond.io. Si ya trabajás con Twilio o querés una sola API para SMS, voz y WhatsApp, mirá Twilio. Si querés acceso oficial a la API sin markup pero con onboarding asistido, mirá 360dialog.
