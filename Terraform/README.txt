#Reference: Terraform modules:
https://developer.hashicorp.com/terraform/language/modules/syntax

https://registry.terraform.io/namespaces/terraform-aws-modules

#Commands Terraform:
terraform init
terraform plan --var-file "terraform.tfvars"
terraform apply --var-file "terraform.tfvars"
terraform destroy --var-file "terraform.tfvars"


#lệnh load reactjs vào s3
B1: chạy lệnh aws s3 sync <link-file-build-reactjs-cua-ban> s3://project-ecommerce-doantuankiet   
B2: vào invalidation của cloudfront
B3: nhập:  /index.html
B4: save

#lỗi tạo acm quá thời gian(time out).
Trong route53 tôi có tạo acm để create certificate dùng https, theo thiết kế hệ thống
chúng ta sẽ gắn certificate này vào cloudfront, nhưng do cloudfront là service global, nên ta phải tạo certificate
ở reagion us-east-1.
Nhưng vì 1 lý do nào đó mà nó tạo quá lâu -> tự tạo bằng tay certificate nhé.

#lệnh cơ bản ec2
#Update OS
sudo yum update -y

#Instal HTTPD
sudo yum install httpd -y

#Enable httpd
sudo systemctl enable httpd
sudo service httpd start
service httpd status

#tải git
sudo yum install git -y

#tải pip
sudo yum install python3-pip -y

#tải django
pip3 install django

#tạo môi trường venv
python3 -m venv venv

#kích hoạt venv
source venv/bin/activate

#tải django vào venv
pip install django
#tải package cần thiết bằng file requirement.txt
pip install -r /path/to/requirements.txt