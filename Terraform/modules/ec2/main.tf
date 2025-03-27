module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.6"  # Phiên bản mới nhất tại thời điểm hiện tại

  name                   = var.jenkins_server_name
  ami                    = var.jenkins_server_ami # AMI Amazon Linux 2
  instance_type          = var.jenkins_server_instance_type
  subnet_id              = var.public_subnet_ids[0]  # Đặt trong public subnet
  vpc_security_group_ids = [module.jenkins_sg.security_group_id]
  associate_public_ip_address = true  # Gán public IP để truy cập
  key_name               = var.key_name # Để SSH

  # Cấu hình root volume với 20 GiB gp3
  root_block_device = [{
    volume_type = var.jenkins_volume_type # Loại volume gp3
    volume_size = var.jenkins_volume_size     # Dung lượng 20 GiB
  }]

 user_data = <<-EOF
  #!/bin/bash
  sudo apt update
  sudo apt install -y fontconfig openjdk-17-jre
  java -version
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io-2023.key
  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y jenkins
EOF

  tags = {
    Name = "Jenkins-Server"
  }
}

module "jenkins_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"  # Phiên bản mới nhất tại thời điểm hiện tại

  name        = "Jenkins server security group"
  description = "Security group for Jenkins EC2 with SSH and Jenkins UI ports open"
  vpc_id      = var.vpc_id  # Truyền từ biến, thay vì hardcode

  # Quy tắc ingress
  ingress_cidr_blocks = ["0.0.0.0/0"]  # Mở cho tất cả IP (có thể giới hạn sau)
  ingress_rules       = ["ssh-tcp"]    # Mở port 22 cho SSH

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "Jenkins UI port"
      cidr_blocks = "0.0.0.0/0"  # Mở cho tất cả IP (có thể giới hạn sau)
    }
  ]

  # Quy tắc egress (cho phép tất cả outbound traffic)
  egress_rules = ["all-all"]

  tags = {
    Name = "Jenkins-SG"
  }
}