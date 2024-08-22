resource "tls_private_key" "siddh_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "siddh_ec2_key_pair" {
  key_name   = "siddh-ec2-keypair" 
  public_key = tls_private_key.siddh_ssh_key.public_key_openssh
}

resource "aws_instance" "app_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.siddh_ec2_key_pair.key_name
  tags = {
    Name = "${terraform.workspace}-siddh-ec2"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.siddh_ssh_key.private_key_pem
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",                      
      "sudo apt-get install -y apache2",             
      "sudo systemctl start apache2",                
      "sudo systemctl enable apache2"
    ]
  }

}

