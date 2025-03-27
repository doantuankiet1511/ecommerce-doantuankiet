variable "domain_name" {
  type = string
}
variable "comment" {
  type = string
}
variable "environment" {
  type = string
}
variable "type" {
  type = string
}
variable "cloudfront_distribution_domain_name" {
  type = string
}
variable "cloudfront_distribution_hosted_zone_id" {
  type = string
}
variable "evaluate_target_health" {
  type = bool
}