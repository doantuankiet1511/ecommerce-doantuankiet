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