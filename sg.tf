resource "aws_security_group" "instance-sg" {
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol = "HTTP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 22
    protocol = "-1"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}