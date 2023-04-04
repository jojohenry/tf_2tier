#/root 

#vpc
variable "tag_name" {}
variable "vpc_id" {}
variable "vpc_cidr_block" {}

#ec2
variable "instance_type" {}
variable "keyname" {}
variable "ami" {}

#rds
variable "engine" {}
variable "engine_version" {}
variable "db_name" {}
variable "username" {
  sensitive = true
}
variable "password" {
  sensitive = true
}

variable "region" {
  default = "us-east-1"
}


