resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
