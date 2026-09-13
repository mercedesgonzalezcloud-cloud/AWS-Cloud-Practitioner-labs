terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-south-2" # Europe, Spain.
}
# 1. Obtener la VPC de mi cuenta.
data "aws_vpc" "default" {
  default = true
}

# 2. Obtener las subredes asociadas a la VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# 3. Crear el Target Group para el Load Balancer
resource "aws_lb_target_group" "tf_tg" {
  name        = "tg-desde-terraform"
  port        = 80
  protocol    = "TCP"
  vpc_id      = data.aws_vpc.default.id
  target_type = "instance"
}

# 4. Crear el Network Load Balancer (NLB)
resource "aws_lb" "tf_nlb_Mercedes" {
  name               = "nlb-terraform"
  internal           = false
  load_balancer_type = "network"
  subnets            = data.aws_subnets.default.ids
}

# 5. Crear el Listener para conectar el NLB con el Target Group
resource "aws_lb_listener" "tf_listener" {
  load_balancer_arn = aws_lb.tf_nlb_Mercedes.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_tg.arn
  }
}