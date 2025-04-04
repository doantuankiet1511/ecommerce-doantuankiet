variable "alb_security_group_name" {
  type = string
}
variable "alb_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "acm_certificate_arn_alb" {
  type = string
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "ami_id" {
  type = string
}
variable "backend_security_group_id" {
  type = string
}
variable "rds_endpoint" {
  type = string
}
variable "rds_username" {
  type = string
}
variable "rds_password" {
  type = string
}
variable "rds_name" {  
  type = string
}
variable "db_initializer_id" {
  type = string
}