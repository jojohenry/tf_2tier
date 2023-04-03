#---/Modules/ec2---

variable "ami" {}
variable "instance_type" {}
variable "keyname" {}
variable "ec2_security_group" {}
variable "subnet_ids" {
  type = list(string)
}
variable "user_data" {}