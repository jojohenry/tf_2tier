#---/Modules/alb---

variable "vpc_id" {}
variable "alb_security_group" {}
variable "subnet_ids" {
  type = list(string)
}
variable "aws_instance" {}
variable "tag_name" {}
variable "alb_unhealthy_threshold" {}
variable "alb_healthy_threshold" {}
variable "alb_interval" {}
variable "alb_timeout"{}
variable "alb_port" {}
variable "alb_protocol" {}
