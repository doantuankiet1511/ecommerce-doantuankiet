# Tạo SNS Topic để gửi thông báo
resource "aws_sns_topic" "cpu_alert" {
  name = var.topic_name
}

# Đăng ký email của bạn vào SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.cpu_alert.arn
  protocol  = "email"
  endpoint  = var.your_email  # Thay bằng email của bạn
}