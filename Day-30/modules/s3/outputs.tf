output "bucket_name" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.app_bucket.id
}