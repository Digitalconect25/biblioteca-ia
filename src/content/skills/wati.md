---
titulo: WATI
nivel: avanzado
categoria: whatsapp
resumen: "Plataforma no-code sobre la API oficial de WhatsApp: bandeja compartida, chatbots visuales, difusiones y automatizaciones sin programar."
descripcion: >
  WATI (de Clare.AI) es una plataforma de atención y automatización construida sobre la
  WhatsApp Business API, como partner oficial de Meta. Apunta a pymes que quieren automatizar
  WhatsApp sin escribir código: bandeja de entrada de equipo, chatbots no-code, campañas de
  difusión e integraciones.
comoUsar: >
  Armás chatbots con un constructor visual, programás difusiones con plantillas, gestionás
  conversaciones desde una bandeja compartida y conectás con HubSpot, Shopify, Zapier y otros.
  Para casos a medida tiene API y Webhooks.
comoAcceder: >
  Te registrás en wati.io (hay prueba gratuita), conectás un número a la API de WhatsApp y
  empezás desde el panel. Consultá precios y planes en la web oficial.
gratis: false
enlaces:
  - texto: Sitio oficial (WATI)
    url: https://www.wati.io/
  - texto: Centro de ayuda / documentación
    url: https://support.wati.io/
tags: [whatsapp, automatizacion, no-code, wati, chatbot, crm]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

WATI es una capa no-code sobre la API oficial de WhatsApp. En vez de programar contra Meta, armás bots, difusiones y respuestas desde un panel visual y una bandeja de entrada compartida para tu equipo. Es la vía para una pyme que quiere automatizar WhatsApp en serio (no solo el WhatsApp Business gratis) pero sin equipo técnico. Por debajo usa la WhatsApp Business API como partner oficial de Meta.

## Cómo empezar

1. Registrate en wati.io y arrancá la prueba gratuita.
2. Conectá un número a la WhatsApp Business API desde el alta guiada (incluye la verificación del negocio en Meta).
3. Cargá tus **plantillas** de mensaje y mandalas a aprobar.
4. Armá un **chatbot** con el constructor visual (no-code) para responder consultas frecuentes o calificar leads.
5. Programá **difusiones** segmentadas y conectá integraciones (HubSpot, Shopify, Zapier, etc.).

## Ejemplo real

Flujo típico de automatización sin escribir código:

```
1. Llega un mensaje nuevo a tu número de WhatsApp.
2. El chatbot no-code saluda y ofrece opciones:
   "1) Ver catálogo  2) Hablar con una persona  3) Estado de pedido"
3. Si elige 1, el bot manda una plantilla con el catálogo.
   Si elige 2, la conversación se asigna a un agente en la bandeja compartida.
4. Los contactos quedan etiquetados y sincronizados con tu CRM.
```

Para integraciones a medida, WATI expone API y Webhooks; en ese caso revisá la doc oficial para los endpoints.

## Trucos y errores comunes

- **No es el WhatsApp Business gratis.** WATI corre sobre la API oficial, que tiene reglas (plantillas, ventana de 24 horas) y costos de Meta además del plan de WATI.
- **Plantillas con aprobación.** Las difusiones que inician conversación usan plantillas que Meta debe aprobar; dejá margen antes de una campaña.
- **Ventana de 24 horas.** Igual que en toda la plataforma de WhatsApp: fuera de las 24 horas desde el último mensaje del usuario, solo plantillas.
- **Difusiones masivas con cuidado.** Mandar plantillas a listas frías o no opt-in puede subir el bloqueo de usuarios y bajar tu calificación de calidad del número.
- **Costos en capas.** Pagás el plan de WATI más lo que cobra Meta por conversación. Confirmá precios en la web oficial.

## Cuándo conviene

Conviene para pymes y equipos de soporte/ventas que quieren bots, difusiones y bandeja compartida sin programar. Si tenés equipo técnico y querés el menor costo, la Cloud API directa de Meta. Si necesitás omnicanal fuerte (varias redes en una bandeja) con automatización avanzada y IA, mirá respond.io. Si ya usás Twilio o querés una sola API multicanal, Twilio. Si querés acceso oficial sin markup pero programando, 360dialog.
