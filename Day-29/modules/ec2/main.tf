resource "aws_security_group" "instance_sg" {
  name_prefix = "ec2-ssh-sg-"
  
  description = "Security group for SSH access"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere; modify this for better security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "Siddh-SG-EC2 SSH Access"
  }
}

resource "aws_instance" "app_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  tags = {
    Name = join("-", ["instance", var.name])
  }
}

output "instance_id" {
  value = aws_instance.app_instance.id
}
output "sg_id" {
  value = aws_security_group.instance_sg.id
}


