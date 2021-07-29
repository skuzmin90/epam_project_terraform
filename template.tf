data "template_file" "script-var" {
  template = "${file("create_docker_app.sh")}"
  vars = {
    "db_name" = "${aws_db_instance.postgresql.db_name}"
    "db_user" = "${aws_db_instance.postgresql.db_username}"
    "db_password" = "${aws_db_instance.postgresql.db_password}"
    "db_host" = "${aws_db_instance.postgresql.address}"
    "db_port" = "${aws_db_instance.postgresql.port}"
  }
  depends_on = [aws_db_instance.postgresql]
}

