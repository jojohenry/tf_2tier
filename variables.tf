#---/root---

#vpc
variable "tag_name" {
  type        = string
  description = "This configures the vpc name"
}
variable "vpc_cidr_block" {
  type        = string
  description = "This configures the vpc cidr"
}

variable "alb_healthy_threshold" {
  type        = string
  description = "This configures the public subnet cidr"
}

variable "alb_unhealthy_threshold" {
  type        = string
  description = "This configures the public subnet cidr"
}



variable "availability_zones" {
  type        = list(string)
  description = "This configures the public subnet cidr"
}

variable "alb_interval" {}

variable "alb_timeout" {}
variable "alb_port" {}
variable "alb_protocol" {}



#ec2
variable "instance_type" {}
variable "ec2_web_tag_name" {}
variable "keyname" {}
variable "ami" {}
#database
variable "identifier" {}
variable "engine" {}
variable "engine_version" {}
variable "db_name" {}
variable "username" {
  sensitive = true
}
variable "password" {
  sensitive = true
}




