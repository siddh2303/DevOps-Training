resource "aws_instance" "app_server" {  
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [var.web_sg_id]
  tags = {
    Name = "Siddh-Web-Instance"
  }
}

resource "aws_eip" "web_eip" {
  instance   = aws_instance.app_server.id
}