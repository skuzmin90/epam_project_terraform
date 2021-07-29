resource "aws_db_subnet_group" "db-group" {
  subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.public-subnet-1.id]
}

resource "aws_db_instance" "postgresql" {
  instance_class = "db.t2.micro"
  engine = "postgres"
  engine_version = "10.17"
  allocated_storage = 10
  max_allocated_storage = 25
  db_name = "${var.db_name}"
  db_username = "${var.db_user}"
  db_password = "${var.db_password}"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  db_subnet_group_name = aws_db_subnet_group.db-group.name
  publicly_accessible = true
  tags = {
    Name = "PostgreSQL"
  }
}

