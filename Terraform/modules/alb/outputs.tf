output "alb_security_group" {
  value = module.alb_security_group.security_group_id
}
output "alb_dns_name" {
  value = aws_lb.fukiapp.dns_name
}
output "alb_zone_id" {
  value = aws_lb.fukiapp.zone_id
}