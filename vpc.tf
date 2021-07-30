resource "aws_vpc" "vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "public-1" {
  cidr_block = "10.10.1.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name                        = "public-subnet-1"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/alb"    = 1
  }
}
resource "aws_subnet" "public-2" {
  cidr_block = "10.10.2.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public-subnet-2"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/alb"    = 1
  }
}
resource "aws_subnet" "private-1" {
  cidr_block = "10.10.3.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-1"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/alb"    = 1
  }
}

resource "aws_subnet" "private-2" {
  cidr_block = "10.10.4.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-2"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/alb"    = 1
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
resource "aws_route_table" "private-rt-1" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw-1.id
  }
  tags = {
    Name = "private-rt-1"
  }
}

resource "aws_route_table" "private-rt-2" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw-2.id
  }
  tags = {
    Name = "private-rt-2"
  }
}

resource "aws_route_table_association" "public-association" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public-1.id
}
resource "aws_route_table_association" "public-association-2" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public-2.id
}
resource "aws_route_table_association" "private-association-1" {
  route_table_id = aws_route_table.private-rt-1.id
  subnet_id = aws_subnet.private-1.id
}
resource "aws_route_table_association" "private-association-2" {
  route_table_id = aws_route_table.private-rt-2.id
  subnet_id = aws_subnet.private-2.id
}