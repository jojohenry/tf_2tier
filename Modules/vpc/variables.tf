#---/Modules/vpc---
variable "tag_name" {
  type        = string
  description = "This configures the vpc name"
}
variable "vpc_cidr_block" {
  type        = string
  description = "This configures the vpc cidr"
}
variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "This configures the public subnet cidr"
}
variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "This configures the private subnet cidr"
}
variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones for this subnet"
}
