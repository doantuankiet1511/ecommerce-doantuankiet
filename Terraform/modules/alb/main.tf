module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name               = var.alb_name
  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnet_ids[1]
  security_groups = [module.alb_security_group.security_group_id]

  # Target Group cho backend
  target_groups = [
    {
      name             = "fukiapp-backend-tg"
      backend_protocol = "HTTP"
      backend_port     = 8000
      target_type      = "instance"
      health_check = {
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
      }
    }
  ]

  # Listeners (thay http_tcp_listeners và https_listeners)
  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    },
    https = {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = var.acm_certificate_arn_alb
      forward = {
        target_group_key = "fukiapp-backend-tg"  # Key phải khớp với name trong target_groups
      }
    }
  }

  tags = {
    Name        = "fukiapp-alb"
    Environment = "production"
  }
}

module "alb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = var.alb_security_group_name
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Mở port 80 từ Internet
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Mở port 443 từ Internet
    }
  ]

  # Egress mặc định cho phép ALB gửi traffic đến backend qua Target Group
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Name        = "fukiapp-alb-sg"
    Environment = "production"
  }
}