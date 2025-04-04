#keypair
variable "key_name" {
  description = "udemy-singapore-key"
  type        = string
  default     = "udemy-singapore-key"
}

#vpc
variable "vpc_name" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "availability_zones" {
  type = list(any)
}
variable "public_subnet_ips" {
  type        = list(string)
  description = "List of public subnet IPs CIDR"
}
variable "private_subnet_ips" {
  type        = list(string)
  description = "List of private subnet IPs CIDR"
}
variable "enable_nat_gateway" {
  type    = bool
  default = false
}
variable "enable_vpn_gateway" {
  type = bool
}
variable "create_igw" {
  type = bool
}

#s3
variable "bucket_name" {
  type = string
}
variable "index_document" {
  type = string
}
variable "error_document" {
  type = string
}
variable "block_public_acls" {
  type = bool
}
variable "block_public_policy" {
  type = bool
}
variable "ignore_public_acls" {
  type = bool
}
variable "restrict_public_buckets" {
  type = bool
}


#cloudfont
variable "OAI" {
  type = string
}
variable "target_origin_id" {
  type = string
}
variable "viewer_protocol_policy" {
  type = string
}
variable "allowed_methods" {
  type = list(any)
}
variable "cached_methods" {
  type = list(any)
}
variable "compress" {
  type = bool
}
variable "min_ttl" {
  type = number
}
variable "default_ttl" {
  type = number
}
variable "max_ttl" {
  type = number
}
variable "error_code" {
  type = number
}
variable "response_code" {
  type = number
}
variable "response_page_path" {
  type = string
}
variable "is_ipv6_enabled" {
  type = bool
}
variable "price_class" {
  type = string
}
variable "default_root_object" {
  type = string
}
variable "enabled" {
  type = bool
}
variable "restriction_type" {
  type = string
}
variable "cloudfront_default_certificate" {
  type = bool
}
variable "acm_certificate_arn_cloudfont" {
  type = string
}

#ec2
variable "jenkins_server_name" {
  type = string
}
variable "jenkins_server_ami" {
  type = string
}
variable "jenkins_server_instance_type" {
  type = string
}
variable "jenkins_volume_size" {
  type = string
}
variable "jenkins_volume_type" {
  type = string
}
variable "backend_security_group_name" {
  type = string
}


#route53
variable "domain_name" {
  type = string
}
variable "comment" {
  type = string
}
variable "environment" {
  type = string
}
variable "type" {
  type = string
}
variable "evaluate_target_health" {
  type    = bool
  default = false
}

#alb
variable "alb_name" {
  type = string
}
variable "acm_certificate_arn_alb" {
  type = string
}
variable "alb_security_group_name" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "rds_password" {
  type = string
}

#rds
variable "db_instance_class" {
  type = string
}
variable "db_username" {
  type = string
}
variable "db_password" {
  type = string
}
variable "db_name" {
  type = string
}
variable "myIP" {
  type = string
  description = "IP của bạn/32"
}
