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
  region = "us-west-2"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source           = "./modules/ec2"
  ami_id           = "ami-08c40ec9ead489470"
  instance_type    = "t2.micro"
  public_subnet_id = module.vpc.public_subnet_id
  web_sg_id        = module.security.ec2_sg_id
}

module "rds" {
  source             = "./modules/rds"
  private_subnet_ids = [module.vpc.public_subnet_id, module.vpc.private_subnet_id]
  db_name            = "mydatabase"
  db_username        = "admin"
  db_password        = "password"
  db_sg_id           = module.security.rds_sg_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-app-bucket"
}