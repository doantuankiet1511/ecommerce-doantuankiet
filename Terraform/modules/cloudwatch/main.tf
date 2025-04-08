resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_actions       = [
    var.auto_scaling_policy_scale_up_arn,
    var.aws_sns_topic_cpu_alert_arn  # Thêm SNS Topic để gửi email
  ]
  dimensions = {
    AutoScalingGroupName = var.aws_autoscaling_group_backend_asg_name
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "cpu-utilization-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 20
  alarm_actions       = [var.auto_scaling_policy_scale_down_arn]
  dimensions = {
    AutoScalingGroupName = var.aws_autoscaling_group_backend_asg_name
  }
}