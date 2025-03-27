output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids_1" {
  value = module.vpc.public_subnets[0]
  description = "danh sách public subnet z"
}