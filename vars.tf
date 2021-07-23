variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0dc2d3e4c0f9ebd18"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "keyname" {
  default = "testKEY"
}

locals {
  vars {
    db_name = aws_db_instance.postgresql.name
    db_user = aws_db_instance.postgresql.username
    db_password = aws_db_instance.postgresql.password
    db_host = aws_db_instance.postgresql.address
    db_port = aws_db_instance.postgresql.port
  }
}