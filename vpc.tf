resource "aws_vpc" "vpc" {
  cidr_block                       = "10.10.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
  depends_on = [aws_vpc.vpc]
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
  depends_on = [aws_vpc.vpc, aws_internet_gateway.igw]
}

resource "aws_route_table" "private-rt-1" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw-1.id
  }
  tags = {
    Name = "private-rt-1"
  }
  depends_on = [aws_nat_gateway.gw-1]
}

resource "aws_route_table" "private-rt-2" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw-2.id
  }
  tags = {
    Name = "private-rt-2"
  }
  depends_on = [aws_nat_gateway.gw-2]
}

resource "aws_route_table_association" "public-association-1" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-1.id
  depends_on = [aws_subnet.public-1, aws_route_table.public-rt]
}
resource "aws_route_table_association" "public-association-2" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-2.id
  depends_on = [aws_subnet.public-2, aws_route_table.public-rt]
}
resource "aws_route_table_association" "private-association-1" {
  route_table_id = aws_route_table.private-rt-1.id
  subnet_id      = aws_subnet.private-1.id
  depends_on = [aws_subnet.private-1, aws_route_table.private-rt-1]
}
resource "aws_route_table_association" "private-association-2" {
  route_table_id = aws_route_table.private-rt-2.id
  subnet_id      = aws_subnet.private-2.id
  depends_on = [aws_subnet.private-2, aws_route_table.private-rt-2]
}