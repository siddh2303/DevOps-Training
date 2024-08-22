# Output the public IP of the EC2 instance
output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.ec2.ec2_public_ip
}

# Output the name of the S3 bucket
output "s3_bucket_name" {
  description = "The name of the S3 bucket created"
  value       = module.s3.bucket_name
}
 