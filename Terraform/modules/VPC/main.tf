resource "aws_vpc" "ivolve" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-Ivolve"
  }
}
######################[Internet Gateway]######################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ivolve.id
  tags = {
    Name = "IGW-Ivolve"
  }
}

######################[2-Subnets]######################
resource "aws_subnet" "subnet_1a" {
  vpc_id     = aws_vpc.ivolve.id
  cidr_block = var.subnet_a_cidr
  availability_zone = var.subnet_a_az
  map_public_ip_on_launch = true
  tags = {
    # -----> Master
    Name = "public-1a"
  }
}
# resource "aws_subnet" "subnet_1b" {
#   vpc_id     = aws_vpc.ivolve.id
#   cidr_block = var.subnet_b_cidr
#   availability_zone = var.subnet_b_az
#   map_public_ip_on_launch = true
#   tags = {
      # -----> Master
#     Name = "public-1b"
#   }
# }

######################[Route Table]######################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ivolve.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public-RT"
  }
}

######################[Route Table Association]######################
resource "aws_route_table_association" "subnet_1a" {
  subnet_id      = aws_subnet.subnet_1a.id
  route_table_id = aws_route_table.public.id
}
# resource "aws_route_table_association" "subnet_1b" {
#   subnet_id      = aws_subnet.subnet_1b.id
#   route_table_id = aws_route_table.public.id
# }
