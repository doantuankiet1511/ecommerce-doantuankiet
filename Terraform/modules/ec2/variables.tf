variable "jenkins_server_name" {
  type = string
}
variable "jenkins_server_ami" {
  type = string
}
variable "jenkins_server_instance_type" {
  type = string
}
variable "vpc_id" {
  type = string
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
