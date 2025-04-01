resource "aws_db_instance" "fukiapp_rds" {
  identifier           = "fukiapp-rds"
  
  # Cấu hình engine MySQL
  engine               = "mysql"
  engine_version       = "8.0"                  # Chỉ cần engine_version
  instance_class       = var.db_instance_class  # Free Tier eligible
  allocated_storage    = 20                     # Dung lượng lưu trữ (GB)
  
  # Thông tin database
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password        # Mật khẩu nhạy cảm, dùng biến
  port                 = 3306
  
  # Gắn vào VPC
  vpc_security_group_ids = [module.rds_security_group.security_group_id]  # Security Group từ module
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name     # Tham chiếu subnet group

  # Cấu hình backup và maintenance
  backup_retention_period = 7                    # Lưu backup 7 ngày
  backup_window           = "03:00-04:00"
  maintenance_window      = "Mon:04:00-Mon:05:00"

  # Bật encryption
  storage_encrypted       = true

  # Tắt snapshot cuối cùng khi destroy để tránh chi phí
  skip_final_snapshot     = true

  # Tags
  tags = {
    Name        = "fukiapp-rds"
    Environment = "production"
  }
}


# Tạo DB Subnet Group riêng (bắt buộc khi không dùng module)
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "fukiapp-rds-subnet-group"
  subnet_ids = var.private_subnet_ids  # Danh sách private subnet IDs

  tags = {
    Name        = "fukiapp-rds-subnet-group"
    Environment = "production"
  }
}

resource "null_resource" "db_setup" {
  depends_on = [aws_db_instance.fukiapp_rds]

  provisioner "local-exec" {
    command = <<EOT
      mysql -h ${aws_db_instance.fukiapp_rds.endpoint} -u ${var.db_username} -p${var.db_password} ${var.db_name} < ../fukiappdb.sql
    EOT
  }
}

# Tạo Security Group cho RDS
module "rds_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "fukiapp-rds-sg"
  description = "Security group for RDS MySQL"
  vpc_id      = var.vpc_id  # Gắn SG vào VPC

  # Ingress rule: Cho phép traffic từ backend SG vào port 3306
  ingress_with_source_security_group_id = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      source_security_group_id = var.backend_security_group_id  # Cho phép từ SG của backend
      description              = "Allow MySQL traffic from backend instances"
    }
  ]

  # Egress rules: Cho phép outbound traffic
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"  # Tất cả protocol
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = var.myIP  # IP của bạn, phải là list of string
      description = "Allow outbound MySQL traffic to your IP"
    }
  ]

  tags = {
    Name        = "fukiapp-rds-sg"
    Environment = "production"
  }
}