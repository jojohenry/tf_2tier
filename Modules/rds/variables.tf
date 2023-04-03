#---/Modules/rds---

variable "engine" {}
variable "engine_version" {}
variable "instance_class" {
  default = "db.t2.small"
}
variable "allocated_storage" {
  default = 10
}
variable "db_name" {}
variable "username" {
  sensitive = true
}
variable "password" {
  sensitive = true
}
variable "rds-sg" {}
variable "subnet_ids" {}


