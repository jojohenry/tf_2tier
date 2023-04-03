#---/Modules/securitygroups---

# create security group for the application load balancer
resource "aws_security_group" "alb-sg" {
  name        = "alb security group"
  description = "enable http access on port 80"
  vpc_id      = var.vpc_id


  ingress {
    description = "Allow HTTP Access from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

# create security group for SSH 
resource "aws_security_group" "ssh-sg" {
  name        = "SSH Security Group"
  description = "Allow SSH Access on Port 22"
  vpc_id      = var.vpc_id


  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH-sg"
  }
}

# create security group for the webserver via alb

resource "aws_security_group" "ec2-sg" {
  name        = "Instance security group"
  description = "Allow HTTP Access on Port 80 via ALB SG & SSH Port 22 via internet"
  vpc_id      = var.vpc_id


  ingress {
    description     = "Allow HTTP Access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.alb-sg.id}"]
  }

  ingress {
    description     = "Allow SSH Access"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ssh-sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Instance Security Group"
  }
}

# create security group for the rds

resource "aws_security_group" "rds-sg" {
  name        = "RDS Security Group"
  description = "Enable MYSQL Access on Port 3306 "
  vpc_id      = var.vpc_id


  ingress {
    description     = "Allow MYSQL Access"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ec2-sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds Security Group"
  }
}