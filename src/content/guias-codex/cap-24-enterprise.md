---
titulo: 'Equipos, Enterprise y Seguridad'
parte: Avanzado
n: 24
tipo: capitulo
resumen: "ChatGPT Team vs Enterprise, admin console, SSO/SAML, control de acceso a repos, audit logs, data residency, compliance (SOC2, HIPAA), retention, opt-out de training, IP del código generado."
objetivos:
  - Elegir el plan correcto para tu equipo.
  - Entender los controles de seguridad disponibles.
  - Responder a las preguntas típicas de IT/legal antes de adoptar Codex.
actualizado: 2026-05-30
---

Si vas a usar Codex en un equipo o empresa, no alcanza con "lo usamos individual": tenés que pensar
acceso, auditoría, compliance y costos.

## Plan: Team vs Enterprise

| | Team | Enterprise |
|---|---|---|
| Usuarios | hasta cierto número | sin límite práctico |
| Admin console | Sí, básica | Sí, completa |
| SSO / SAML | No (login propio) | Sí |
| Audit logs | No | Sí |
| Data residency | Default | Configurable (UE, US) |
| Workspace privado | Sí | Sí + namespaces |
| Soporte | Estándar | Dedicado |
| SLA | No | Sí |
| Opt-out training | Sí (a nivel cuenta) | Sí + garantías contractuales |

Para empresas reguladas (finanzas, salud, gobierno) → Enterprise.

## Admin console

Desde la consola de admin podés:

- Ver y desactivar usuarios.
- Configurar políticas (qué modelos pueden usar, costos máximos).
- Gestionar workspaces (separar equipos).
- Ver costos por usuario y por proyecto.
- Configurar integraciones a nivel org (no usuario por usuario).

## SSO / SAML

Enterprise se conecta con Okta, Google Workspace, Microsoft Entra ID, Auth0. Configurás:

- Provisión automática de usuarios al alta.
- Desactivación automática al baja.
- Grupos del IdP mapeados a roles de Codex.

## Audit logs

Quién hizo qué y cuándo. Útiles para:

- Compliance.
- Investigar incidentes ("¿quién aprobó este PR generado por Codex?").
- Reporting de uso.

Exportables vía API o webhook hacia tu SIEM.

## Data residency

Enterprise permite elegir región donde se procesan los datos:

- US (default).
- UE (importante para GDPR).
- Otras regiones según disponibilidad.

## Compliance

- **SOC 2 Type II**: certificado.
- **GDPR**: cumple con DPA disponible.
- **HIPAA**: BAA disponible en Enterprise para casos calificados.
- **ISO 27001**: certificado.

## Retention

Default: las tasks se retienen 30 días para soporte. Configurable a 0 (no retención) en Enterprise,
con tradeoff: si pasa algo, soporte tiene menos contexto para ayudar.

## Opt-out de training

Tu código NO se usa para entrenar modelos si:

- Estás en Team o Enterprise (default).
- Estás en Plus/Pro y activaste el opt-out en Settings → Data Controls.

En Enterprise viene por escrito en el contrato.

## IP del código generado

El código que genera Codex es **tuyo**. OpenAI no reclama propiedad. Si Codex genera código que
inadvertidamente reproduce código con copyright (poco común pero posible), seguís siendo
responsable del review. Por eso: nunca mergear sin revisar.

## Costos

En Team/Enterprise:

- Cuota incluida + overage pagado.
- Dashboard de costos por usuario y por proyecto.
- Alertas automáticas configurables (no llegar al límite por sorpresa).

## Checklist pre-adopción

Para tech lead que va a llevar Codex a su empresa:

- [ ] Plan elegido (Team o Enterprise) según tamaño y compliance.
- [ ] SSO configurado.
- [ ] Política de "no commitear secrets" formal y comunicada.
- [ ] Branch protection que requiera review humano.
- [ ] Audit logs exportándose al SIEM.
- [ ] Onboarding doc para nuevos devs ("cómo usamos Codex acá").
- [ ] Presupuesto mensual y alerta al 80%.
