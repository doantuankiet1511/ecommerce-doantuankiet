variable "vpc_name" {
  type = string  
}
variable "cidr_block" {
  type = string
}
variable "availability_zones" {
  type = list(any)
}
variable "public_subnet_ips" {
  type = list(string)
  description = "List of public subnet IPs CIDR"
}
variable "private_subnet_ips" {
  type = list(string)
  description = "List of private subnet IPs CIDR"
}
variable "enable_nat_gateway" {
  type = bool
}
variable "enable_vpn_gateway" {
  type = bool
}
variable "create_igw" {
  type = bool
}

