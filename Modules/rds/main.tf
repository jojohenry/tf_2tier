#/modules/rds

resource "aws_db_instance" "rdsinstance" {
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  skip_final_snapshot = true

  db_name  = var.db_name
  username = var.username
  password = var.password
  allocated_storage = var.allocated_storage

  vpc_security_group_ids = [var.rds-sg]
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "dbsubnet"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "dbsubnet"
  }
}