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
variable "backend_security_group_id" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "myIP" {
  type = string
  description = "IP của bạn/32"
}
variable "private_subnet_ids" {
  type = list(string)
}
