output "rds_endpoint" {
  value = aws_db_instance.fukiapp_rds.endpoint
}
output "db_username" {
  value = aws_db_instance.fukiapp_rds.username
}
output "db_name" {
  value = aws_db_instance.fukiapp_rds.db_name
}
output "rds_setup_id" {
  value = null_resource.db_setup.id
}