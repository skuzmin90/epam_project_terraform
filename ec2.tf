data "template_file" "script-var" {
  template = "${file("create_docker_app.sh")}"
  vars = {
    db_name = "${aws_db_instance.postgresql.name}"
    db_user = "${aws_db_instance.postgresql.username}"
    db_password = "${aws_db_instance.postgresql.password}"
    db_host = "${aws_db_instance.postgresql.address}"
    db_port = "${aws_db_instance.postgresql.port}"
  }
}

resource "aws_instance" "ec2-webapp-1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = [aws_security_group.instance-sg.id]
  subnet_id = aws_subnet.public-subnet-1.id
  associate_public_ip_address =  "true"
  user_data = "${file("create_docker_app.sh")}"
  key_name = "${var.keyname}"
  depends_on = [aws_db_instance.postgresql]
  tags = {
    Name = "webapp-1"
  }
}
