resource "aws_db_instance" "mysql" {
  identifier           = "siddh-mydb"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  allocated_storage = 20
  publicly_accessible  = false
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name = aws_db_subnet_group.siddh-main.name
  skip_final_snapshot  = false
  final_snapshot_identifier = "i-skip-snapshot"

  tags = {
    Name= "Siddh-db"
  }
  
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_db_subnet_group" "siddh-main" {
  name        = "siddh-main"
  subnet_ids   = var.private_subnet_ids  
  tags = {
    Name = "siddh-main_db_subnet_group"
  }
}