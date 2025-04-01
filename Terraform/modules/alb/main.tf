# Tạo Launch Template cho backend
resource "aws_launch_template" "backend" {
  name_prefix   = "fukiapp-backend-lt"
  image_id      = var.ami_id
  instance_type = "t2.medium"

  user_data = base64encode(<<-EOF
    #!/bin/bash
    # Cấu hình settings.py
    cd /home/ec2-user/Django-Ecommerce/fukiappstore/fukiapp/fukiapp
    sed -i "s/'HOST': .*/'HOST': '${var.rds_endpoint}',/" settings.py
    sed -i "s/'USER': .*/'USER': '${var.rds_username}',/" settings.py
    sed -i "s/'PASSWORD': .*/'PASSWORD': '${var.rds_password}',/" settings.py
    sed -i "s/'NAME': .*/'NAME': '${var.rds_name}',/" settings.py
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

  depends_on = [var.rds_setup_id] # Đảm bảo database được khởi tạo trước
}

# Module ALB
# Tạo ALB
resource "aws_lb" "fukiapp" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.alb_security_group.security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "fukiapp-alb"
    Environment = "production"
  }
}

# Tạo target group
resource "aws_lb_target_group" "backend" {
  name     = "fukiapp-backend-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# HTTP Listener - Redirect to HTTPS
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.fukiapp.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# HTTPS Listener
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.fukiapp.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-southeast-1:266324947842:certificate/1a1b6769-ee68-433c-bd88-94e09c14eb40"  # Thay thế bằng ARN của chứng chỉ thực tế

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
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
  target_group_arns = [aws_lb_target_group.backend.arn] # Tham chiếu ARN từ target_groups
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