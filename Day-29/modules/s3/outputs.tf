output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.app_bucket.id
}
output "bucket_region" {
  description = "The AWS region where the S3 bucket is created"
  value       = aws_s3_bucket.app_bucket.region
}
