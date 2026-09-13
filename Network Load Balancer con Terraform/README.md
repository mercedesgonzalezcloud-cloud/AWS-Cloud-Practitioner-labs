# Creación de AWS Network Load Balancer (NLB) con Terraform

Proyecto de Infraestructura como Código (IaC) para el despliegue automatizado de un **Network Load Balancer (NLB)** en Amazon Web Services (AWS) utilizando Terraform.

## 🚀 Arquitectura Desplegada
- **Región:** España (`eu-south-2`)
- **VPC & Subredes:** Detección automática de la VPC y Subredes por defecto mediante `data sources`.
- **Target Group:** Configurado en puerto 80 TCP con destino de tipo `instance`.
- **Network Load Balancer:** NLB público de alta disponibilidad.
- **Listener:** Redirección de tráfico TCP en el puerto 80 hacia el Target Group.

## 🛠️ Tecnologías Utilizadas
- **Terraform** v1.16+
- **AWS Provider** ~> 5.0
- **AWS EC2 / Elastic Load Balancing**

## 💻 Comandos de Terraform de Ejecución
```bash
# Inicializar proveedores
terraform init

# Previsualizar cambios
terraform plan

# Desplegar infraestructura
terraform apply

# Eliminar recursos
terraform destroy