---
titulo: Automatizar tus despliegues en Render
nivel: intermedio
herramienta: Render
tiempo: 30 min
resumen: "Conectá tu repo para deploy automático en cada push, declará la infra en render.yaml y programá tareas con cron jobs."
descripcion: >
  Vas a dejar tu aplicación desplegándose sola: conectás el repositorio de Git para que Render
  publique con cada push, definís toda la infraestructura como código en un archivo render.yaml
  (un Blueprint) y agregás una tarea programada con un cron job. Todo verificado contra la
  documentación oficial de Render.
objetivo: Dejar un servicio que se despliega automáticamente en cada push y una tarea programada, todo declarado en render.yaml.
requisitos:
  - Una cuenta en Render (render.com), creada con tu cuenta de Git
  - Un repositorio en GitHub, GitLab o Bitbucket con tu app
  - Conocer los comandos de build y de arranque de tu proyecto
  - Opcional, la CLI de Render instalada para validar el render.yaml
pasos:
  - titulo: "1. Conectar el repo y crear el primer servicio"
    detalle: "En el dashboard de Render, New > Web Service. Conectá tu repositorio y elegí la rama. Cargá el Build Command (ej. npm install) y el Start Command (ej. npm start) y creá el servicio."
  - titulo: "2. Confirmar el auto-deploy"
    detalle: "El auto-deploy viene en On Commit por defecto: cada push o merge a la rama conectada dispara un deploy. Podés revisarlo y cambiarlo en Settings del servicio (On Commit, After CI Checks Pass u Off)."
  - titulo: "3. Probar que se despliega solo"
    detalle: "Hacé un cambio chico, commiteá y pusheá a la rama conectada. Mirá en la pestaña de Events/Deploys cómo Render reconstruye y publica sin que toques nada."
    comun: "git commit -am \"probar auto-deploy\" && git push origin main"
  - titulo: "4. Definir la infraestructura como código (render.yaml)"
    detalle: "Creá un archivo render.yaml en la raíz del repo describiendo tus servicios. Esto te permite versionar la infra y recrearla en cualquier momento. Validalo con la CLI antes de subirlo."
    comun: "render blueprints validate"
  - titulo: "5. Agregar un cron job al Blueprint"
    detalle: "Sumá un servicio de tipo cron con su schedule (expresión cron en UTC) y el comando a ejecutar. Render garantiza una sola corrida activa a la vez por cron job."
  - titulo: "6. Crear todo desde el Blueprint"
    detalle: "Commiteá y pusheá el render.yaml. En el dashboard, New > Blueprint, conectá el repo, revisá los cambios propuestos y hacé clic en Deploy Blueprint. Render provisiona todos los recursos. Después auto-sincroniza al actualizar el archivo."
    comun: "git add render.yaml && git commit -m \"infra como codigo\" && git push"
enlaces:
  - texto: "Render Docs (inicio)"
    url: https://render.com/docs
  - texto: "Infraestructura como código (Blueprints)"
    url: https://render.com/docs/infrastructure-as-code
  - texto: "Referencia del render.yaml (Blueprint spec)"
    url: https://render.com/docs/blueprint-spec
  - texto: "Cron Jobs"
    url: https://render.com/docs/cronjobs
  - texto: "Deploys y auto-deploy"
    url: https://render.com/docs/deploys
  - texto: "CLI de Render"
    url: https://render.com/docs/cli
tags: [despliegue, render, automatizacion, cron, iac]
actualizado: 2026-05-28
revisarAntesDe: 2026-09-28
---

Al terminar vas a tener tu aplicación desplegándose sola con cada push, toda la infraestructura descrita en un solo archivo `render.yaml` que podés versionar, y una tarea que corre sola según un horario. Tres niveles de automatización: deploy continuo, infraestructura como código y tareas programadas.

Este es un ejemplo de `render.yaml` con un servicio web más un cron job, según la estructura oficial de Render:

```yaml
services:
  - type: web
    name: mi-api
    runtime: node
    plan: starter
    repo: https://github.com/usuario/mi-repo
    branch: main
    buildCommand: npm install
    startCommand: npm start
    autoDeployTrigger: commit

  - type: cron
    name: limpieza-diaria
    runtime: node
    plan: starter
    repo: https://github.com/usuario/mi-repo
    branch: main
    schedule: "0 2 * * *"   # todos los dias a las 02:00 UTC
    buildCommand: npm install
    startCommand: node tareas/limpieza.js
```

## Qué tener en cuenta

El `render.yaml` va en la raíz del repositorio (podés indicar otra ruta al crear el Blueprint). La clave de nivel superior es `services` para todo lo que no sea PostgreSQL; las bases de datos PostgreSQL van bajo `databases`.

El `schedule` del cron usa expresiones cron estándar y siempre en **UTC**, no en tu hora local: ajustá el horario teniendo eso en cuenta. Por ejemplo, `0 2 * * *` corre a las 02:00 UTC. Render asegura que haya como máximo una corrida activa de un mismo cron a la vez; si una corrida se solapa con la siguiente, posterga la próxima. Las corridas se terminan automáticamente a las 12 horas.

Nunca pongas secretos (claves, contraseñas, tokens) en el `render.yaml`: ese archivo se versiona en Git. Usá variables de entorno o Environment Groups. Y respetá la regla de oro: un recurso lo administra un solo Blueprint, nunca dos.

Sobre planes y costos: los valores de cada plan (`free`, `starter`, etc.) y qué incluye la capa gratuita cambian seguido. No te guíes por números de memoria; confirmá siempre en la página oficial de precios de Render.

## Si algo falla

- **El push no dispara deploy.** Verificá que el auto-deploy esté en On Commit en Settings y que estés pusheando exactamente a la rama conectada. Revisá que el commit no incluya `[skip render]`.
- **El Blueprint no crea los recursos.** Validá el archivo con `render blueprints validate` antes de subirlo. Un YAML mal indentado o un campo requerido faltante (`name`, `type`, `runtime`, `buildCommand`, `startCommand`, y `schedule` en el cron) frena todo.
- **El deploy falla en el build.** Mirá los logs del deploy. Suele ser el Build Command equivocado o dependencias que no se instalan; reproducí ese comando localmente.
- **El cron no corre cuando esperabas.** Acordate de que el `schedule` está en UTC. Convertí tu hora local a UTC antes de definirlo.
- **Cambios en el render.yaml que no se aplican.** Render auto-sincroniza por defecto, pero si pusiste Auto Sync en No, tenés que apretar Manual Sync en la página del Blueprint.

## Siguiente nivel

- Usá la opción **After CI Checks Pass** para que el deploy espere a que pasen tus tests antes de publicar.
- Sumá una base de datos PostgreSQL al mismo `render.yaml` (bajo `databases`) y conectala por variable de entorno, así toda tu infra nace del mismo archivo.
- Automatizá deploys desde CI con la CLI en modo no interactivo, usando `RENDER_API_KEY` y flags como `--confirm`, `-o json` y `--wait`.
- Activá los preview environments para levantar un entorno temporal por cada Pull Request.
