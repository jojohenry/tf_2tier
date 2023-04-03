#---/Modules/ec2---

# compute module main.tf


resource "aws_instance" "ec2_instance" {
  count = length(var.subnet_ids)

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.keyname
  subnet_id          = var.subnet_ids[count.index]
  vpc_security_group_ids = [var.ec2_security_group]
  user_data = var.user_data
  
  tags = {
    Name = "Webserver ${count.index}"
  }
}

