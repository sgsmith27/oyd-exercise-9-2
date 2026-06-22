# Exercise 9.2 — CloudWatch Dashboards

Curso: Optimizaciones y Desempeño — Cloud Deployment Automation

## Objetivo

Extender el módulo de observabilidad desarrollado en el Exercise 9.1 mediante la creación de un CloudWatch Dashboard centralizado para visualizar métricas operativas y el estado de alarmas desde una única vista.

El dashboard permite al equipo de operaciones monitorear:

* Volumen de solicitudes (Request Count)
* Errores HTTP 5XX
* Estado de alarmas críticas

sin necesidad de navegar entre múltiples pantallas de CloudWatch.

---

## Arquitectura

```text
Application Load Balancer
           │
           ▼
CloudWatch Metrics
           │
           ├──────────────► Request Count Widget
           │
           ├──────────────► HTTP 5XX Widget
           │
           ▼
CloudWatch Alarms
           │
           ▼
Alarm Status Widget

Todos los componentes son visibles desde:

CloudWatch Dashboard
```

---

## Estructura del proyecto

```text
oyd-exercise-9-2/
├── versions.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── envs/
│   └── dev/
│       └── dev.tfvars
├── modules/
│   └── observability/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── evidence/
    └── dashboard.png
```

---

## Dashboard Implementado

Nombre:

```text
finapi-dashboard
```

Recurso Terraform:

```hcl
resource "aws_cloudwatch_dashboard" "main"
```

La definición del dashboard utiliza:

```hcl
dashboard_body = jsonencode({...})
```

cumpliendo el requerimiento de evitar heredoc strings.

---

## Widgets Configurados

### Widget 1 — ALB Request Count

Métrica:

```text
AWS/ApplicationELB
```

Nombre:

```text
RequestCount
```

Configuración:

```text
Statistic: Sum
Period: 300 seconds
```

Dimensión:

```text
LoadBalancer = var.alb_arn_suffix
```

---

### Widget 2 — HTTP 5XX Errors

Métrica:

```text
AWS/ApplicationELB
```

Nombre:

```text
HTTPCode_Target_5XX_Count
```

Configuración:

```text
Statistic: Sum
Period: 300 seconds
```

Dimensión:

```text
LoadBalancer = var.alb_arn_suffix
```

---

### Widget 3 — HTTP 5XX Alarm

Tipo:

```text
Alarm Widget
```

Referencia Terraform:

```hcl
aws_cloudwatch_metric_alarm.http_5xx.arn
```

El widget muestra el estado actual de la alarma:

```text
OK
ALARM
INSUFFICIENT_DATA
```

---

## Terraform Outputs

### Dashboard URL

```bash
terraform output dashboard_url
```

Salida:

```text
https://us-east-2.console.aws.amazon.com/cloudwatch/home?region=us-east-2#dashboards:name=finapi-dashboard
```

Este enlace permite acceder directamente al dashboard desde la consola AWS.

---

## Comandos Ejecutados

Inicialización:

```bash
terraform init
```

Validación:

```bash
terraform validate
```

Planificación:

```bash
terraform plan -var-file="envs/dev/dev.tfvars"
```

Despliegue:

```bash
terraform apply -var-file="envs/dev/dev.tfvars"
```

---

## Evidencias

Captura requerida:

![dashboard](/evidence/dashboard.PNG)

La evidencia muestra:

* Dashboard creado correctamente
* Tres widgets visibles
* Estado de la alarma HTTP 5XX
* CloudWatch Dashboard accesible desde AWS Console

---

## Conceptos Aplicados

* CloudWatch Dashboards
* CloudWatch Metrics
* CloudWatch Alarms
* Application Load Balancer Metrics
* Terraform Modules
* jsonencode()
* Infrastructure as Code
* Observability Automation
* Dashboard Outputs

---

## Lecciones Aprendidas

* Los dashboards de CloudWatch requieren widgets válidos definidos mediante JSON.
* El uso de `jsonencode()` facilita la integración de expresiones Terraform dentro de la definición del dashboard.
* Los widgets métricos deben incluir explícitamente la propiedad:

```text
region
```

para que CloudWatch acepte la configuración.

* Los dashboards permiten centralizar información operativa y reducir el tiempo de diagnóstico ante incidentes.

---

## Cleanup

Para eliminar los recursos del ejercicio:

```bash
terraform destroy -var-file="envs/dev/dev.tfvars"
```

Este comando elimina:

* CloudWatch Dashboard
* CloudWatch Alarms
* SNS Topics
* SNS Subscriptions
* CloudWatch Log Group
* AWS Budget
* Recursos asociados del módulo de observabilidad

```
```

## Autor
Sergio Geovany García Smith

Carnet 2500813


