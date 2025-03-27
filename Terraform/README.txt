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

