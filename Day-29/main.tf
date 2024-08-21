terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

module "ec2" {
  source                 = "./modules/ec2"
  ami                    = "ami-000a81e3bab21747d"
  instance_type          = "t2.micro"
  name                   = "siddh-ec2"
  region                 = "us-east-2"
}
module "aws_s3_bucket" {
  source = "./modules/s3"
  bucket_name = "siddh-bucket-custom"
  environment = "prod"
}