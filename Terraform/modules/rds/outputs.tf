output "rds_endpoint" {
  value = split(":", aws_db_instance.fukiapp_rds.endpoint)[0]
}
output "db_username" {
  value = aws_db_instance.fukiapp_rds.username
}
output "db_name" {
  value = aws_db_instance.fukiapp_rds.db_name
}
output "rds_instance_id" {
  value = aws_db_instance.fukiapp_rds.id
}