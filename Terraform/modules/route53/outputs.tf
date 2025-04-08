# output "acm_arn" {
#   value = module.acm.acm_certificate_arn
# }
output "route53_ns_record" {
  value = module.route53_zone.route53_zone_name_servers
}