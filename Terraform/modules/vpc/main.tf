terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr_block
  azs             = var.availability_zones
  private_subnets = var.private_subnet_ips
  public_subnets  = var.public_subnet_ips
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  create_igw = var.create_igw


  public_subnet_tags = {
    "Name" = "Public Subnet"
  }

  private_subnet_tags = {
    "Name" = "Private Subnet"
  }

  tags = {
    Terraform = "true"
    Project_name = "e-commerce"
    Name = var.vpc_name
  }
}