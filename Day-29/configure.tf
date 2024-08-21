terraform {
  backend "s3" {
    bucket         = "siddh-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "siddh-terraform-state-lock"
  }
}
