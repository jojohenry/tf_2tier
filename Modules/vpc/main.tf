#/modules/vpc 

#Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "${var.tag_name}-vpc"
  }
}

#Create the NAT Gateway
resource "aws_nat_gateway" "nat" {
  count             = length(aws_subnet.public)
  allocation_id     = aws_eip.nat[count.index].id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public[count.index].id

  tags = {
    Name        = "nat-gateway-${count.index}"
  }
}

#Create Internet Gateway and Attach it to VPC
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.tag_name}-igw"
  }
}

#Create the Elastic IP
resource "aws_eip" "nat" {
  depends_on =[aws_internet_gateway.gateway]
  count = length(aws_subnet.public)

  vpc = true

  tags = {
    Name        = "nat-eip-${count.index}"
  }
}

#Use Data Source to get all Availablility Zones in Region
data "aws_availability_zones" "available_zones" {}

#Generates a Random Permutation of a List of Strings
resource "random_shuffle" "az" {
  input = data.aws_availability_zones.available_zones.names
  result_count = 2
}

#Create Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = true
  availability_zone = random_shuffle.az.result[count.index]

  tags = {
    Name = "Public-Subnet-${count.index}"
  }
}

#Create Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr_blocks[count.index]
  availability_zone = random_shuffle.az.result[count.index]

  tags = {
    Name = "Private-Subnet-${count.index}"
  }
}

#Create Route Table and Add Public Route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "Public RT-${var.tag_name}"
  }
}

#Create Route Table and Add Private Route
resource "aws_route_table" "private_route_table" {
  count = 2
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[count.index].id
  }

  tags = {
    Name = "Private RT-${var.tag_name}"
  }
}

#Associate Public Subnets to Public Route Table
resource "aws_route_table_association" "public_assoc" {
  count = length(aws_subnet.public)
  subnet_id     = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

#Associate Private Subnets to Private Route Table
resource "aws_route_table_association" "private_assoc" {
  count = length(aws_subnet.private)
  subnet_id     = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}