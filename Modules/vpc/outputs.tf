#--/Modules/vpc---
output "aws_public_subnet" {
  value = aws_subnet.public.*.id
}

output "aws_private_subnet" {
  value = aws_subnet.private.*.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "internet_gateway" {
  value = aws_internet_gateway.gateway
}

