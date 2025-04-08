output "alb_security_group" {
  value = module.alb_security_group.security_group_id
}
output "alb_dns_name" {
  value = aws_lb.fukiapp.dns_name
}
output "alb_zone_id" {
  value = aws_lb.fukiapp.zone_id
}
output "auto_scaling_policy_scale_down_arn" {
  value = aws_autoscaling_policy.scale_down.arn
}
output "auto_scaling_policy_scale_up_arn" {
  value = aws_autoscaling_policy.scale_up.arn
}
output "aws_autoscaling_group_backend_asg_name" {
  value = aws_autoscaling_group.backend_asg.name
}