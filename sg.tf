resource "aws_security_group" "instance-sg" {
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
  ingress {
    from_port = 80
    protocol = "http"
    to_port = 80
  }
  egress {
    from_port = 22
    protocol = "-1"
    to_port = 22
  }
}