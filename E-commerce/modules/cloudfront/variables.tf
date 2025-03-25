variable "s3_bucket_domain_name" {
  type = string
}
variable "OAI" {
  type = string
}
variable "target_origin_id" {
  type = string
}
variable "viewer_protocol_policy" {
  type = string
}
variable "allowed_methods" {
  type = list(any)
}
variable "cached_methods" {
  type = list(any)
  default = ["HEAD", "GET"]
}
variable "compress" {
  type = bool
}
variable "min_ttl" {
  type = number
}
variable "default_ttl" {
  type = number
}
variable "max_ttl" {
  type = number
}
variable "error_code" {
  type = number
}
variable "response_code" {
  type = number
}
variable "response_page_path" {
  type = string
}
variable "is_ipv6_enabled" {
  type = bool
}
variable "price_class" {
  type = string
}
variable "default_root_object" {
  type = string
}
variable "enabled" {
  type = bool
}
variable "restriction_type" {
  type = string
}
variable "cloudfront_default_certificate" {
  type = bool
}
