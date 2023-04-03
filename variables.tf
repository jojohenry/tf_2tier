#---/root---

#vpc
variable "tag_name" {
  type        = string
  description = "This configures the vpc name"
}
variable "vpc_id" {
  type        = string
  description = "This configures the vpc cidr"
}
variable "vpc_cidr_block" {
  type        = string
  description = "This configures the vpc cidr"
}



variable "region" {}



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




