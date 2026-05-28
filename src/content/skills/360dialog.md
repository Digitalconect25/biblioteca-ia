---
titulo: 360dialog
nivel: avanzado
categoria: whatsapp
resumen: "Proveedor oficial (BSP) de la API de WhatsApp, con acceso directo a la API, sin markup sobre las tarifas de Meta y onboarding asistido."
descripcion: >
  360dialog es un Business Solution Provider (BSP) oficial de Meta para la WhatsApp Business
  Platform. Te da acceso a la API con tu propia API key, sin recargo por mensaje sobre lo que
  cobra Meta, y te acompaña en la verificación del negocio y el alta del número.
comoUsar: >
  Conectás tu número y usás la API con el header D360-API-KEY para enviar mensajes y plantillas
  y recibir Webhooks. Te integrás desde tu backend o desde herramientas del marketplace, sin
  tener que pasar por la consola de Meta.
comoAcceder: >
  Te registrás en 360dialog, conectás el número y verificás el negocio (podés usar verificación
  asistida por el partner). Hay un Sandbox gratuito para probar. Consultá precios en la web oficial.
gratis: false
enlaces:
  - texto: Documentación oficial (360dialog)
    url: https://docs.360dialog.com/
  - texto: WhatsApp Business API en 360dialog
    url: https://www.360dialog.com/whatsapp-api
tags: [whatsapp, automatizacion, api, 360dialog, bsp]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

360dialog es un proveedor oficial (BSP) de la API de WhatsApp. La diferencia clave frente a otros revendedores es su modelo sin markup: pagás las tarifas de Meta sin recargo por mensaje del proveedor. A cambio te da acceso completo a la API con tu propia API key, soporte y ayuda con la verificación del negocio. Es una vía intermedia: más simple que lidiar directo con Meta, pero pensada para que igual programes la integración.

## Cómo empezar

1. Registrate en 360dialog y conectá tu número de WhatsApp a la plataforma.
2. Verificá tu negocio (en Meta Business Suite o con la verificación asistida por el partner) y conseguí la aprobación de la cuenta de WhatsApp.
3. Generá tu **D360-API-KEY** para el número (canal). Importante: solo la API key más reciente queda válida; si generás otra, la anterior deja de funcionar.
4. Para probar sin alta real, usá el **Sandbox**: enviás `START` por WhatsApp al número que indica la doc y obtenés una API key de prueba que solo manda a tu propio teléfono.
5. Configurá tus **Webhooks** para recibir entrantes y estados.

## Ejemplo real

Enviar un mensaje de texto con la API de 360dialog (reemplazá la API key y el destinatario):

```bash
curl -X POST \
  'https://waba-v2.360dialog.io/messages' \
  -H 'D360-API-KEY: TU_API_KEY' \
  -H 'Content-Type: application/json' \
  -d '{
    "messaging_product": "whatsapp",
    "recipient_type": "individual",
    "to": "5491122334455",
    "type": "text",
    "text": { "body": "Hola, te escribo vía 360dialog." }
  }'
```

La autenticación va por el header `D360-API-KEY` (no Bearer). El base path puede variar según el entorno (sandbox vs producción); confirmá el vigente en la doc oficial.

## Trucos y errores comunes

- **Una sola API key válida.** Al regenerar la API key, la vieja se invalida al instante. Si rota sin que actualices tu backend, los envíos cortan.
- **Ventana de 24 horas y plantillas.** Igual que con Meta directo: fuera de las 24 horas necesitás plantilla aprobada.
- **Sandbox limitado.** El Sandbox solo envía a tu propio número y sirve para probar la integración, no para clientes.
- **Sin markup, pero no gratis.** No cobran recargo por mensaje sobre Meta, pero hay tarifas de plataforma. Confirmá precios en la web oficial.
- **Verificación del negocio.** El alta de producción depende de verificar el negocio en Meta; dejá margen de tiempo.

## Cuándo conviene

Conviene si querés acceso oficial a la API, transparencia de costos (sin markup por mensaje) y ayuda con el alta, pero igual vas a programar la integración. Si buscás el costo más bajo y máximo control crudo, la Cloud API directa de Meta. Si querés algo sin código con bandeja y bots visuales, WATI o respond.io. Si ya usás Twilio o necesitás multicanal con una sola API, Twilio.
