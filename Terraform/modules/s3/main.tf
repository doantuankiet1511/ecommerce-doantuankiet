module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.1"

  bucket = var.bucket_name # Tên bucket duy nhất

  # Cấu hình website hosting
  website = {
    index_document = var.index_document
    error_document = var.error_document
  }

  # Chặn truy cập công khai
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  # Tags
  tags = {
    Name        = "ReactJS Bucket"
    Environment = "default"
  }
}

resource "aws_s3_bucket_policy" "allow_cdn" {
  bucket = module.s3.s3_bucket_id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action = "s3:GetObject"
        Resource = "${module.s3.s3_bucket_arn}/*"
      }
    ]
  })
}