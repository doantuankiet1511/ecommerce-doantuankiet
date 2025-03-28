module "route53_zone" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "fukishop.click" = {  # Thay bằng tên miền của bạn
      comment = var.comment
      tags = {
        Name        = var.domain_name
        Environment = var.environment
      }
    }
  }
}
# #Module ACM Certificate
# module "acm" {

#   source  = "terraform-aws-modules/acm/aws"
#   version = "~> 4.0"
#   domain_name       = var.domain_name  # Thay bằng tên miền của bạn
#   zone_id           = module.route53_zone.route53_zone_zone_id[var.domain_name]
#   validation_method = "DNS"

#   subject_alternative_names = [
#     "*.fukishop.click"  # Bao gồm wildcard cho subdomains nếu cần
#   ]

#   wait_for_validation = true  # Chờ xác minh hoàn tất
  
#   tags = {
#     Name        = "fukishop.click-ssl"
#     Environment = "production"
#   }
# }

resource "aws_route53_record" "cloudfront" {
  zone_id = module.route53_zone.route53_zone_zone_id[var.domain_name]
  name    = var.domain_name
  type    = var.type

  alias {
    name                   = var.cloudfront_distribution_domain_name
    zone_id                = var.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}