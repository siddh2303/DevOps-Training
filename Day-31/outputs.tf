output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "web_ec2_ids" {
  value = module.ec2.ec2_id
}

output "db_instance_id" {
  value = module.rds.rds_id
}

output "s3_bucket_name" {
  value = module.s3.s3_b_name
}