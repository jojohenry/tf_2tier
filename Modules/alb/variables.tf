#---/Modules/alb---
variable "lb_port" {
  default ="80"
}
variable "lb_protocol" {
  default = "HTTP"
}
variable "lb_interval" {
  default = "300"
} 
variable "lb_timeout" {
  default ="60"
}

variable "lb_healthy_threshold" {
  default ="5"
}
variable "lb_unhealthy_threshold" {
  default = "5"
} 

variable "alb_security_group" {}
variable "subnet_ids" {
  type = list(string)
}
variable "aws_instance" {}
variable "tag_name" {}
variable "vpc_id" {}