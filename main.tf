#Root Module

#Create the Application Load Balancer
module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  alb_security_group = module.security.alb-sg
  aws_instance       = module.ec2.aws_instance
  tag_name           = var.tag_name
  subnet_ids         = module.vpc.aws_public_subnet
}

#Create the RDS Database Instance
module "rds" {
  source         = "./modules/rds"
  engine         = var.engine
  engine_version = var.engine_version
  db_name        = var.db_name
  username       = var.username
  password       = var.password
  rds-sg         = module.security.rds-sg
  subnet_ids     = module.vpc.aws_private_subnet
}

#Create the EC2 Instance
module "ec2" {
  source             = "./modules/ec2"
  ami                = var.ami
  instance_type      = var.instance_type
  keyname            = var.keyname
  ec2_security_group = module.security.ec2-sg
  subnet_ids         = module.vpc.aws_public_subnet
  user_data          = file("./userdata.tpl")
}


#Create the Security Groups
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

#Create the VPC
module "vpc" {
  source                     = "./modules/vpc"
  tag_name                   = var.tag_name
  public_subnet_cidr_blocks  = [for i in range(1, 3, 1) : cidrsubnet(var.vpc_id, 8, i)]
  private_subnet_cidr_blocks = [for i in range(3, 5, 1) : cidrsubnet(var.vpc_id, 8, i)]
  vpc_cidr_block             = var.vpc_cidr_block
}