resource "aws_s3_bucket" "app_bucket" {
  bucket = "siddh-bucket"
  tags = {
    Name  = "siddh-bucket"
  }
  
  lifecycle {
    ignore_changes = [tags]
  }
}
resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}