#---/Modules/vpc---

# create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  
  tags = {
    Name = "${var.tag_name}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.tag_name}-igw"
  }
}

resource "aws_eip" "nat" {
  count = length(aws_subnet.public)

  vpc = true

  tags = {
    Name        = "nat-eip-${count.index}"
  }
}

resource "aws_nat_gateway" "nat" {
  count             = length(aws_subnet.public)
  allocation_id     = aws_eip.nat[count.index].id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public[count.index].id

  tags = {
    Name        = "nat-gateway-${count.index}"
  }
}


# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

#create public subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

#create private subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "private-subnet-${count.index}"
  }
}

# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "${var.tag_name}-public route table"
  }
}

# create route table and add private route
resource "aws_route_table" "private_route_table" {
  count = 2
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[count.index].id
  }

  tags = {
    Name = "${var.tag_name}-private route table"
  }
}



# associate public subnets to "public route table"
resource "aws_route_table_association" "public" {
  count          = 2 #length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# associate private subnets to "private route table"
resource "aws_route_table_association" "private" {
  count          = 2 #length(aws_subnet.private)
  subnet_id     = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index]
}