variable "jenkins_server_name" {
  type = string
}
variable "jenkins_server_ami" {
  type = string
}
variable "jenkins_server_instance_type" {
  type = string
}
variable "vpc_id_backend_security_group" {
  type = string
}
variable "vpc_id" {
  
}
variable "key_name" {
  description = "udemy-singapore-key"
  type        = string
  default     = "udemy-singapore-key"
}
variable "jenkins_volume_size" {
  type = string
}
variable "jenkins_volume_type" {
  type = string
}
variable "public_subnet_ids" {
  type = list(string)
  description = "Id của Subnet"
}
variable "backend_security_group_name" {
  type = string
}
variable "alb_security_group_id" {
  type = string
}
