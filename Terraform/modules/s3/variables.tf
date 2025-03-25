variable "bucket_name" {
  type = string
}
variable "index_document" {
  type = string
}
variable "error_document" {
  type = string
}
variable "block_public_acls" {
  type = bool
}
variable "block_public_policy" {
  type = bool
}
variable "ignore_public_acls" {
  type = bool
}
variable "restrict_public_buckets" {
  type = bool
}