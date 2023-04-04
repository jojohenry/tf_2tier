#/root 

variable "AWS_SECRET_ACCESS_KEY" {}
variable "CONFIRM_DESTROY" {}
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_DEFAULT_REGION" {}

#vpc
variable "tag_name" {
  default = "Week22"
}
variable "vpc_id" {
  type        = string
  description = "This configures the vpc cidr"
  default    = "10.0.0.0/16"
}
variable "vpc_cidr_block" {
  type        = string
  description = "This configures the vpc cidr"
  default     = "10.0.0.0/16"
}

#ec2
variable "instance_type" {
  default = "t2.micro"
}
variable "keyname" {
  default = "JojoKeys"
}
variable "ami" {
  default = "ami-0dfcb1ef8550277af"
}

#rds
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "8.0.28"
}
variable "db_name" {
  default = "rdsdb"
}
variable "username" {
  sensitive = true
  default  = "user"
}
variable "password" {
  sensitive = true
  default = "password"
}

variable "region" {
  default = "us-east-1"
}


