# 
# Tạo Launch Template riêng cho backend
resource "aws_launch_template" "backend" {
  name_prefix   = "fukiapp-backend-lt"
  image_id      = var.ami_id
  instance_type = "t2.medium"

  user_data = base64encode(<<-EOF
    #!/bin/bash
    # Tạo database nếu chưa tồn tại
    mysql -h ${var.rds_endpoint} -u ${var.rds_username} -p${var.rds_password} -e "CREATE DATABASE IF NOT EXISTS fukiappdb;"
    # Import file SQL
    mysql -h ${var.rds_endpoint} -u ${var.rds_username} -p${var.rds_password} fukiappdb < /home/ec2-user/Mysql-Ecommerce/fukiappdb.sql
    # Cấu hình settings.py
    cd /home/ec2-user/Django-Ecommerce/fukiappstore/fukiapp/fukiapp
    sed -i "s/'HOST': .*/'HOST': '${var.rds_endpoint}',/" settings.py
    sed -i "s/'USER': .*/'USER': '${var.rds_username}',/" settings.py
    sed -i "s/'PASSWORD': .*/'PASSWORD': '${var.rds_password}',/" settings.py
    sed -i "s/'NAME': .*/'NAME': 'fukiappdb',/" settings.py
    # Chạy ứng dụng
    cd /home/ec2-user/Django-Ecommerce/fukiappstore/fukiapp
    nohup gunicorn --workers 3 --bind 0.0.0.0:8000 fukiapp.wsgi:application &
    EOF
  )

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.backend_security_group_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "fukiapp-backend"
      Environment = "production"
    }
  }
}

# Module ALB
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"
  
  name               = var.alb_name
  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnet_ids
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
      create_attachment = false
    }
    
  ]

  # Listeners
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
    default_action = {
    type             = "forward"
    target_group_arn = module.alb.target_groups["0"].arn
      }
    }
  }

  tags = {
    Name        = "fukiapp-alb"
    Environment = "production"
  }
}

# Module ALB Security Group
module "alb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = var.alb_security_group_name
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTP from Internet"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTPS from Internet"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    }
  ]

  tags = {
    Name        = "fukiapp-alb-sg"
    Environment = "production"
  }
}

# Module Backend ASG
module "backend_asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 6.0"

  name = "fukiapp-backend-asg"

  vpc_zone_identifier = var.private_subnet_ids
  target_group_arns = [module.alb.target_groups["0"].arn]  # Tham chiếu ARN từ target_groups
  health_check_type   = "ELB"
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2

  launch_template = aws_launch_template.backend.id
   

  tags = {
    Name        = "fukiapp-backend"
    Environment = "production"
  }
}