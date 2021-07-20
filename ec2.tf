resource "aws_instance" "ec2-webapp-1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = aws_security_group.instance-sg.id
  subnet_id = aws_subnet.public-subnet-1.id
  associate_public_ip_address = "true"
  user_data = "${file("create_docker_app.sh")}"
  key_name = "${var.keyname}"
  tags = {
    Name = "webapp-1"
  }
}