resource "aws_vpc" "exercise1-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_classiclink = false
  enable_dns_hostnames = true
  instance_tenancy = "default"

  tags = {
    Name = "exercise-1"
  }
}

resource "aws_subnet" "exercise1-public-subnet" {
  vpc_id = aws_vpc.exercise1-vpc.id
  map_public_ip_on_launch = true
  cidr_block = var.PUBLIC_SUBNET_CIDR_BLOCK
  availability_zone = var.availability_zone_names[0]

  tags = {
    Name = "exercise-1-public-subnet"
  }
}

resource "aws_subnet" "exercise1-private-subnet" {
  vpc_id = aws_vpc.exercise1-vpc.id
  cidr_block = var.PRIVATE_SUBNET_CIDR_BLOCK
  availability_zone = var.availability_zone_names[1]

  tags = {
    Name = "exercise-1-private-subnet"
  }
}