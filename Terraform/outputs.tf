output "route53_ns_record" {
  value = module.route53.route53_ns_record
  description = "giá trị để gắn vào nguồn cung cấp domain name"
}
output "rds_endpoint" {
  value = module.rds.rds_endpoint
  description = "endpoint của rds"
}