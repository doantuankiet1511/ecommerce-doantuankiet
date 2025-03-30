output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids_1" {
  value = module.vpc.public_subnets[0]
  description = "public subnet số 1"
}
output "public_subnet_ids_2" {
  value = module.vpc.public_subnets[1]
  description = "public subnet số 2"
}
output "private_subnet_ids_3" {
  value = module.vpc.private_subnets[0]
  description = "private subnet số 1"
}
output "private_subnet_ids_4" {
  value = module.vpc.private_subnets[1]
  description = "private subnet số 2"
}