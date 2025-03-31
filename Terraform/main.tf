terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
      configuration_aliases = [aws.use1]
    }
  }
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

provider "aws" {
  region = "ap-southeast-1"

}

module "alb" {
  source = "./modules/alb"
  alb_name = var.alb_name
  public_subnet_ids = [module.vpc.public_subnet_ids_2, module.vpc.public_subnet_ids_1]
  acm_certificate_arn_alb = var.acm_certificate_arn_alb
  vpc_id = module.vpc.vpc_id
  alb_security_group_name = var.alb_security_group_name
  ami_id = var.ami_id
  backend_security_group_id = module.ec2.backend_security_group_id
  rds_endpoint = module.rds.rds_endpoint
  rds_password = var.rds_password
  rds_username = module.rds.db_username
  private_subnet_ids = [module.vpc.private_subnet_ids_1, module.vpc.private_subnet_ids_2]
}

module "ec2" {
  source = "./modules/ec2"
  jenkins_server_ami = var.jenkins_server_ami
  jenkins_server_instance_type = var.jenkins_server_instance_type
  jenkins_server_name = var.jenkins_server_name
  key_name = var.key_name
  vpc_id = module.vpc.vpc_id
  jenkins_volume_size = var.jenkins_volume_size
  jenkins_volume_type = var.jenkins_volume_type
  public_subnet_ids = [module.vpc.public_subnet_ids_1]
  alb_security_group_id = module.alb.alb_security_group_id
  backend_security_group_name = var.backend_security_group_name
  vpc_id_backend_security_group = module.vpc.vpc_id
}

module "rds" {
  source = "./modules/rds"
  db_instance_class = var.db_instance_class
  db_name = var.db_name
  db_password = var.db_password
  db_username = var.db_username
  backend_security_group_id = module.ec2.backend_security_group_id
  vpc_id = module.vpc.vpc_id
  myIP = var.myIP
  private_subnet_ids = [module.vpc.private_subnet_ids_1, module.vpc.private_subnet_ids_2]
}

# module "route53" {
#   source                                 = "./modules/route53"
#   domain_name                            = var.domain_name
#   comment                                = var.comment
#   type                                   = var.type
#   environment                            = var.environment
#   cloudfront_distribution_domain_name    = module.cloudfront.cloudfont_domain_name
#   cloudfront_distribution_hosted_zone_id = module.cloudfront.cloudfront_distribution_hosted_zone_id
#   evaluate_target_health                 = var.evaluate_target_health
#   # providers = {
#   #   aws.use1 = aws.use1
#   # }
# }


# module "s3" {
#   source                  = "./modules/s3"
#   bucket_name             = var.bucket_name
#   index_document          = var.index_document
#   error_document          = var.error_document
#   block_public_acls       = var.block_public_acls
#   block_public_policy     = var.block_public_policy
#   ignore_public_acls      = var.ignore_public_acls
#   restrict_public_buckets = var.restrict_public_buckets
#   cloudfront_arn          = module.cloudfront.cloudfront_distribution_arn
# }

# module "cloudfront" {
#   source                         = "./modules/cloudfront"
#   s3_bucket_domain_name          = module.s3.s3_bucket_domain_name
#   OAI                            = var.OAI
#   target_origin_id               = var.target_origin_id
#   viewer_protocol_policy         = var.viewer_protocol_policy
#   allowed_methods                = var.allowed_methods
#   cached_methods                 = var.cached_methods
#   compress                       = var.compress
#   min_ttl                        = var.min_ttl
#   default_ttl                    = var.default_ttl
#   max_ttl                        = var.max_ttl
#   error_code                     = var.error_code
#   response_code                  = var.response_code
#   response_page_path             = var.response_page_path
#   is_ipv6_enabled                = var.is_ipv6_enabled
#   price_class                    = var.price_class
#   default_root_object            = var.default_root_object
#   enabled                        = var.enabled
#   restriction_type               = var.restriction_type
#   cloudfront_default_certificate = var.cloudfront_default_certificate
#   acm_certificate_arn_cloudfont = var.acm_certificate_arn_cloudfont
# }

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


