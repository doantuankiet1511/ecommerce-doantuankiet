# Tạo Launch Template cho backend
resource "aws_launch_template" "backend" {
  name_prefix   = "fukiapp-backend-lt"
  image_id      = var.ami_id
  instance_type = "t2.medium"

 user_data = base64encode(<<-EOF
    #!/bin/bash
    # Đảm bảo quyền sở hữu mã nguồn cho ec2-user
    chown -R ec2-user:ec2-user /home/ec2-user/Django-Ecommerce

    # Cấu hình settings.py dưới quyền ec2-user
    su ec2-user -c "cd /home/ec2-user/Django-Ecommerce/fukiappstore/fukiapp/fukiapp && \
      sed -i \"s/'HOST': .*/'HOST': '${var.rds_endpoint}',/\" settings.py && \
      sed -i \"s/'USER': .*/'USER': '${var.rds_username}',/\" settings.py && \
      sed -i \"s/'PASSWORD': .*/'PASSWORD': '${var.rds_password}',/\" settings.py && \
      sed -i \"s/'NAME': .*/'NAME': '${var.rds_name}',/\" settings.py"

    # Chạy migrate để cập nhật CSDL
    su ec2-user -c "cd /home/ec2-user/Django-Ecommerce/fukiappstore/fukiapp && \
      /usr/bin/python3 manage.py migrate"

    # Chạy Gunicorn dưới quyền ec2-user
    su ec2-user -c "cd /home/ec2-user/Django-Ecommerce/fukiappstore/fukiapp && \
      nohup /usr/bin/python3 -m gunicorn --workers 3 --bind 0.0.0.0:8000 fukiapp.wsgi:application > /tmp/gunicorn.log 2>&1 &"
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

  depends_on = [var.db_initializer_id]
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
  certificate_arn   = var.acm_certificate_arn_alb  # Thay thế bằng ARN của chứng chỉ thực tế

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
# module "backend_asg" {
#   source  = "terraform-aws-modules/autoscaling/aws"
#   version = "~> 6.0"

#   name = "fukiapp-backend-asg"

#   vpc_zone_identifier = var.private_subnet_ids
#   target_group_arns = [aws_lb_target_group.backend.arn] # Tham chiếu ARN từ target_groups
#   health_check_type   = "ELB"
#   min_size            = 2
#   max_size            = 4
#   desired_capacity    = 2

#   launch_template = aws_launch_template.backend.id
  
#   tags = {
#     Name        = "fukiapp-backend"
#     Environment = "production"
#   }
# }
resource "aws_autoscaling_group" "backend_asg" {
  name                = "fukiapp-backend-asg"
  vpc_zone_identifier = var.private_subnet_ids
  target_group_arns   = [aws_lb_target_group.backend.arn]
  health_check_type   = "ELB"
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2

  launch_template {
    id      = aws_launch_template.backend.id
    version = "$Latest"  # Dùng phiên bản mới nhất của Launch Template
  }

  health_check_grace_period = 300  # Thời gian chờ trước khi kiểm tra health (giây)

  tag {
    key                 = "Name"
    value               = "fukiapp-backend"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "production"
    propagate_at_launch = true
  }

  depends_on = [aws_launch_template.backend]  # Đảm bảo Launch Template sẵn sàng
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.backend_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.backend_asg.name
}

# Scheduled Scaling: Scale down lúc 12g đêm (UTC+7)
resource "aws_autoscaling_schedule" "scale_down_midnight" {
  scheduled_action_name  = "scale-down-midnight"
  min_size               = 1
  max_size               = 4
  desired_capacity       = 1
  recurrence             = "0 17 * * *"  # 17:00 UTC = 00:00 UTC+7
  autoscaling_group_name = aws_autoscaling_group.backend_asg.name
}

# Scheduled Scaling: Scale up lúc 8g sáng (UTC+7)
resource "aws_autoscaling_schedule" "scale_up_morning" {
  scheduled_action_name  = "scale-up-morning"
  min_size               = 1
  max_size               = 4
  desired_capacity       = 2  # Hoặc 4 nếu bạn muốn bắt đầu với 4 instance
  recurrence             = "0 1 * * *"   # 01:00 UTC = 08:00 UTC+7
  autoscaling_group_name = aws_autoscaling_group.backend_asg.name
}