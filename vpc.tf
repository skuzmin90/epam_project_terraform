provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "public-subnet-1" {
  cidr_block = "10.10.1.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public-subnet-1"
  }
}
resource "aws_subnet" "private-subnet-1" {
  cidr_block = "10.10.2.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public-association-1" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public-subnet-1.id
}