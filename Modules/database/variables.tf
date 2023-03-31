#---/Modules/database---

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
variable "database-security-group" {}
variable "subnet_ids" {}


