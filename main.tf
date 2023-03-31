#---/root---

#create vpc
module "vpc" {
  source                     = "./Modules/vpc"
  tag_name                   = var.tag_name
  public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
  vpc_cidr_block             = var.vpc_cidr_block
  availability_zones         = ["us-east-1a", "us-east-1b"]
}

module "security-group" {
  source = "./Modules/security-group"
  vpc_id = module.vpc.vpc_id
}

#create an ec2 instance
module "Ec2" {
  source             = "./Modules/ec2"
  ami                = var.ami
  instance_type      = var.instance_type
  ec2_web_tag_name   = var.ec2_web_tag_name
  keyname            = var.keyname
  ec2_security_group = module.security-group.ec2_security_group
  subnet_ids         = module.vpc.aws_public_subnet
}

#create a RDS database instance

module "database" {
  source                  = "./Modules/database"
  identifier              = var.identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  database-security-group = module.security-group.database-security-group
  subnet_ids              = module.vpc.aws_private_subnet
}

#create an application load balancer

module "alb" {
  source                  = "./Modules/alb"
  vpc_id                  = module.vpc.vpc_id
  alb_security_group      = module.security-group.alb_security_group
  aws_instance            = module.Ec2.aws_instance
  tag_name                = var.tag_name
  subnet_ids              = module.vpc.aws_public_subnet
  alb_healthy_threshold   = var.alb_healthy_threshold
  alb_unhealthy_threshold = var.alb_unhealthy_threshold
  alb_timeout             = var.alb_timeout
  alb_interval            = var.alb_interval
  alb_protocol            = var.alb_protocol
  alb_port                = var.alb_port

}



