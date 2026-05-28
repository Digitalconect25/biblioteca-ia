---
titulo: Render
nivel: intermedio
categoria: despliegue
resumen: "Plataforma cloud para desplegar web services, sitios estáticos, cron jobs, workers y bases de datos, con auto-deploy desde Git e infraestructura como código."
descripcion: >
  Render es una plataforma cloud que despliega y escala aplicaciones: web services, sitios
  estáticos, background workers, cron jobs y bases de datos PostgreSQL o Key Value. Conectás tu
  repositorio de Git y publica con cada push. Permite definir toda la infraestructura en un solo
  archivo YAML (render.yaml, sus Blueprints) y trae una CLI oficial para automatizar.
comoUsar: >
  Conectás tu repo de GitHub, GitLab o Bitbucket, elegís el tipo de servicio y definís los comandos
  de build y de arranque. A partir de ahí cada push a la rama conectada dispara un deploy. Para
  varios servicios a la vez, los describís en un render.yaml y los creás de una con un Blueprint.
comoAcceder: >
  Te das de alta en render.com con tu cuenta de Git. Tiene una capa gratuita para empezar (web
  services, sitios estáticos y bases de datos con limitaciones) y planes pagos con más recursos.
  Los precios y los limites de cada plan cambian; consultalos siempre en la pagina oficial de Render.
gratis: true
comandos:
  - titulo: "CLI oficial de Render"
    comun: |
      render login                            # autorizar la CLI desde el navegador
      render services                         # listar servicios y datastores
      render blueprints validate              # validar tu render.yaml
      render deploys create [SERVICE_ID]      # disparar un deploy
enlaces:
  - texto: Documentación oficial
    url: https://render.com/docs
  - texto: Render (sitio)
    url: https://render.com
  - texto: Infraestructura como código (Blueprints)
    url: https://render.com/docs/infrastructure-as-code
  - texto: CLI oficial de Render
    url: https://render.com/docs/cli
tags: [despliegue, cloud, automatizacion]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Render es una plataforma cloud para poner aplicaciones en producción sin pelearte con servidores. Soporta web services, sitios estáticos, private services, background workers, cron jobs y datastores (PostgreSQL y Key Value, compatible con Redis). Su gracia es el flujo desde Git: conectás un repositorio y, con cada push a la rama elegida, Render reconstruye y vuelve a desplegar tu servicio solo. Es una alternativa directa a Heroku, Vercel o Railway, con foco en que todo se pueda declarar como código.

## Cómo empezar

1. Entrá a [render.com](https://render.com) y registrate conectando tu cuenta de GitHub, GitLab o Bitbucket.
2. En el dashboard, elegí **New** y el tipo de servicio que querés (por ejemplo, **Web Service**).
3. Seleccioná tu repositorio y la rama a desplegar.
4. Definí el **Build Command** (cómo se instala/compila, ej. `npm install`) y el **Start Command** (cómo arranca, ej. `npm start`).
5. Elegí un plan y creá el servicio. El primer deploy arranca automáticamente.
6. A partir de ahí, cada push a esa rama dispara un nuevo deploy (auto-deploy "On Commit", que viene activado por defecto).

## Ejemplo real

Tenés una API en Node y querés que se despliegue sola con cada push a `main`. Conectás el repo como Web Service, ponés `npm install` como Build Command y `npm start` como Start Command. Cargás las variables de entorno (claves, URL de base de datos) en la sección Environment. Listo: cada vez que mergeás a `main`, Render reconstruye y publica. Si más adelante querés agregar una base de datos y una tarea programada, los sumás todos en un `render.yaml` y los administrás como un solo Blueprint.

## Trucos y errores comunes

- El auto-deploy viene en **On Commit** por defecto. Podés cambiarlo a **After CI Checks Pass** (esperar a que pasen los tests) u **Off** (solo deploys manuales) desde Settings.
- Para saltarte un deploy puntual, incluí `[skip render]` o `[render skip]` en el mensaje del commit.
- Nunca pongas secretos en el código ni en el `render.yaml`: usá variables de entorno o Environment Groups.
- Si manejás un mismo servicio con más de un Blueprint, el comportamiento se vuelve impredecible. Un recurso, un Blueprint.
- En la capa gratuita, los web services se suspenden tras un periodo de inactividad y vuelven a arrancar con la primera visita (arranque en frío). Tenelo en cuenta para demos.

## Cuándo conviene

Render conviene cuando tu app es algo más que un sitio estático: una API, un backend con base de datos, workers o tareas programadas, y querés todo en una sola plataforma con deploy desde Git. Frente a **Vercel**, que brilla con frontends y funciones serverless (Next.js y similares), Render es más cómodo para servidores siempre encendidos, bases de datos administradas y cron jobs en el mismo lugar. Frente a **Railway**, que también cubre apps full-stack con bases de datos, Render destaca por su infraestructura como código madura (los Blueprints con `render.yaml`) y su capa gratuita. Si tu proyecto es puro frontend, Vercel suele ser más directo; si necesitás backend, datos y tareas juntos y declarados como código, Render es una gran opción.
