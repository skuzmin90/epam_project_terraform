resource "aws_instance" "ec2-webapp-1" {
  ami = "${var.AMI}"
  instance_type = "${var.INSTANCE_TYPE}"
  security_groups = [aws_security_group.instance-sg.id]
  subnet_id = aws_subnet.public-subnet-1.id
  associate_public_ip_address =  "true"
  user_data = templatefile("create_docker_app.sh", {
    "db_name" = "${aws_db_instance.postgresql.name}"
    "db_user" = "${aws_db_instance.postgresql.username}"
    "db_password" = "${aws_db_instance.postgresql.password}"
    "db_host" = "${aws_db_instance.postgresql.address}"
    "db_port" = "${aws_db_instance.postgresql.port}"
  })
  key_name = "${var.KEYNAME}"
  depends_on = [data.template_file.script-var]
  tags = {
    Name = "webapp-1"
  }
}

resource "aws_instance" "ec2-webapp-2" {
  ami = "${var.AMI}"
  instance_type = "${var.INSTANCE_TYPE}"
  security_groups = [aws_security_group.instance-sg.id]
  subnet_id = aws_subnet.public-subnet-2.id
  associate_public_ip_address =  "true"
  user_data = templatefile("create_docker_app.sh", {
    "db_name" = "${aws_db_instance.postgresql.name}"
    "db_user" = "${aws_db_instance.postgresql.username}"
    "db_password" = "${aws_db_instance.postgresql.password}"
    "db_host" = "${aws_db_instance.postgresql.address}"
    "db_port" = "${aws_db_instance.postgresql.port}"
  })
  key_name = "${var.KEYNAME}"
  depends_on = [data.template_file.script-var]
  tags = {
    Name = "webapp-2"
  }
}

resource "aws_route53_zone" "public" {
  name = "skuzmindevops.com"
}

resource "aws_route53_record" "dns-name" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "www.skuzmindevops.com"
  type    = "A"
  ttl     = "300"
}