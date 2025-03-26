terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "alb" {
  source = "./modules/alb"
}

module "ec2" {
  source = "./modules/ec2"
}

module "rds" {
  source = "./modules/rds"
}

module "route53" {
  source = "./modules/route53"
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
  index_document = var.index_document
  error_document = var.error_document
  block_public_acls = var.block_public_acls
  block_public_policy = var.block_public_policy
  ignore_public_acls = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
  cloudfront_arn = module.cloudfront.cloudfront_distribution_arn
}

module "cloudfront" {
  source = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3.s3_bucket_domain_name
  OAI = var.OAI
  target_origin_id = var.target_origin_id
  viewer_protocol_policy = var.viewer_protocol_policy
  allowed_methods = var.allowed_methods
  cached_methods = var.cached_methods
  compress = var.compress
  min_ttl = var.min_ttl
  default_ttl = var.default_ttl
  max_ttl = var.max_ttl
  error_code = var.error_code
  response_code = var.response_code
  response_page_path = var.response_page_path
  is_ipv6_enabled = var.is_ipv6_enabled
  price_class = var.price_class
  default_root_object = var.default_root_object
  enabled = var.enabled
  restriction_type = var.restriction_type
  cloudfront_default_certificate = var.cloudfront_default_certificate
  
}

module "vpc" {
  source = "./modules/vpc"
  availability_zones  = var.availability_zones
  cidr_block          = var.cidr_block
  public_subnet_ips   = var.public_subnet_ips
  private_subnet_ips  = var.private_subnet_ips
  vpc_name            = var.vpc_name
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  create_igw = var.create_igw
}


