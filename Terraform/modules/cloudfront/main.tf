module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~> 3.2"

  # Origin từ S3
  origin = {
    s3 = {
      domain_name = var.s3_bucket_domain_name
      origin_path = "" # Có thể để trống hoặc thêm nếu cần
      origin_access_control_id = aws_cloudfront_origin_access_control.this.id
    }
  }

  default_cache_behavior = {
    target_origin_id       = var.target_origin_id
    viewer_protocol_policy = var.viewer_protocol_policy
    allowed_methods        = var.allowed_methods # Chỉ cần GET và HEAD cho file tĩnh
    cached_methods         = var.cached_methods         # Chỉ cache GET
    compress               = var.compress
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
  }

  custom_error_response = [{
    error_code         = var.error_code
    response_code      = var.response_code
    response_page_path = var.response_page_path
  }]

  is_ipv6_enabled     = var.is_ipv6_enabled
  price_class         = var.price_class # Có thể thay đổi
  default_root_object = var.default_root_object
  enabled             = var.enabled

  geo_restriction = {
    restriction_type = var.restriction_type
  }

  viewer_certificate = {
    cloudfront_default_certificate = var.cloudfront_default_certificate
  }

  tags = {
    Name        = "ReactJS CloudFront"
    Environment = "default"
  }

}

# Tạo Origin Access Control
resource "aws_cloudfront_origin_access_control" "this" {
  name                              = "OAC-${var.s3_bucket_domain_name}"
  description                       = "OAC for S3 bucket ${var.s3_bucket_domain_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"  # Luôn ký request
  signing_protocol                  = "sigv4"   # Dùng Signature Version 4
}