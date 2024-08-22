resource "aws_s3_bucket" "app_bucket" {

  tags = {
    Name = "${terraform.workspace}-siddh-ec2"
  }

  provisioner "local-exec" {
  command = "echo 'S3 Bucket Created Successfully!'"
}

}
