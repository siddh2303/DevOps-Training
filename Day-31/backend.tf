terraform {
  backend "s3" {
    bucket         = "siddh-state-bucket-lock"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "siddh-terraform-state-lock"
  }
}
