resource "aws_subnet" "public-1" {
  cidr_block              = "10.10.1.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public-2" {
  cidr_block              = "10.10.2.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public-3" {
  cidr_block              = "10.10.3.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public-us-east-1c"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private-1" {
  cidr_block        = "10.10.4.0/24"
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  tags = {
    Name                              = "private-us-east-1a"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private-2" {
  cidr_block        = "10.10.5.0/24"
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  tags = {
    Name                              = "private-us-east-1b"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private-3" {
  cidr_block        = "10.10.6.0/24"
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-east-1c"
  tags = {
    Name                              = "private-us-east-1с"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}