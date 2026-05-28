---
titulo: Twilio para WhatsApp
nivel: avanzado
categoria: whatsapp
resumen: "Accedé a la API de WhatsApp a través de Twilio, con un sandbox para probar al toque y una sola API para WhatsApp, SMS, voz y más."
descripcion: >
  Twilio es un proveedor de comunicaciones que da acceso a la WhatsApp Business Platform a
  través de sus propias APIs (Programmable Messaging y Conversations). Te abstrae parte de la
  complejidad de Meta y suma un sandbox para prototipar sin esperar aprobaciones.
comoUsar: >
  Mandás mensajes con la API de Messaging (notificaciones, OTP) o armás conversaciones de ida
  y vuelta con la Conversations API. Usás plantillas con variables y Webhooks para los
  entrantes. Hay SDKs en varios lenguajes.
comoAcceder: >
  Creás una cuenta en Twilio y arrancás con el WhatsApp Sandbox para probar de inmediato. Para
  producción registrás un remitente con el self sign-up de WhatsApp. Consultá precios en la web
  oficial.
gratis: false
enlaces:
  - texto: Documentación oficial (Twilio WhatsApp)
    url: https://www.twilio.com/docs/whatsapp
  - texto: WhatsApp en Twilio
    url: https://www.twilio.com/whatsapp
tags: [whatsapp, automatizacion, api, twilio, sandbox, otp]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Twilio te da acceso a WhatsApp a través de sus propias APIs, con la ventaja de un sandbox que te deja probar en minutos sin esperar aprobaciones de número, y de unificar WhatsApp con SMS, voz y otros canales bajo una misma cuenta y un mismo SDK. Es una buena vía si ya usás Twilio o si querés desarrollar con buen tooling sin lidiar directo con la consola de Meta.

## Cómo empezar

1. Creá una cuenta en Twilio y entrá a la consola.
2. Activá el **WhatsApp Sandbox**: te asigna un número de Twilio y te dice un código para unir tu teléfono enviando un mensaje. Sirve para prototipar entrantes y salientes.
3. Probá un envío desde la consola o con el SDK (Node, Python, etc.) usando tus credenciales (Account SID y Auth Token).
4. Configurá un **Webhook** para los mensajes entrantes.
5. Para producción: registrá un remitente real con el **WhatsApp Self Sign-up** y dejá de depender del sandbox.

## Ejemplo real

Enviar un mensaje con la API REST de Messaging (reemplazá SID, token y números):

```bash
curl -X POST \
  'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXX/Messages.json' \
  --data-urlencode 'From=whatsapp:+14155238886' \
  --data-urlencode 'To=whatsapp:+5491122334455' \
  --data-urlencode 'Body=Hola, te escribo desde Twilio + WhatsApp.' \
  -u ACXXXXXXXX:tu_auth_token
```

El prefijo `whatsapp:` es obligatorio en `From` y `To`. En el sandbox, el `From` es el número del sandbox de Twilio.

## Trucos y errores comunes

- **Ventana de 24 horas.** Igual que en la API directa de Meta: fuera de las 24 horas desde el último mensaje del usuario necesitás una **plantilla** aprobada. Twilio gestiona el envío pero la regla la pone WhatsApp.
- **Sandbox no es producción.** El sandbox solo manda a números que se unieron con el código; no lo uses para clientes reales.
- **Dos APIs distintas.** Para notificaciones de una sola vía usás Programmable Messaging; para conversaciones bidireccionales conviene la Conversations API. Elegí según el caso.
- **OTP con Verify.** Si tu caso es códigos de verificación, Twilio tiene la Verify API que maneja el OTP por WhatsApp sin que armes el flujo a mano.
- **Costos en dos capas.** Pagás lo de WhatsApp/Meta más el cargo de Twilio. Revisá precios actualizados en la web oficial.

## Cuándo conviene

Conviene si ya usás Twilio para SMS o voz y querés sumar WhatsApp con el mismo stack, o si valorás el sandbox para arrancar sin trámites. Si buscás el menor costo por mensaje y control total, la Cloud API directa de Meta es más barata. Si querés algo sin código con bandeja y bots visuales, mirá WATI o respond.io. Si querés acceso oficial sin markup pero con onboarding, mirá 360dialog.
