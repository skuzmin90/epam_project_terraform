resource "aws_db_subnet_group" "db-group" {
  subnet_ids = [
    aws_subnet.public-1.id,
    aws_subnet.public-2.id
  ]
  depends_on = [
    aws_subnet.private-1,
    aws_subnet.private-2,
    aws_subnet.public-1,
    aws_subnet.public-2
  ]
}

resource "aws_db_instance" "postgresql" {
  instance_class = "db.t2.micro"
  engine = "postgres"
  engine_version = "10.17"
  allocated_storage = 10
  max_allocated_storage = 25
  username = "${var.DB_USER}"
  password = "${var.DB_PASSWORD}"
  name = "${var.DB_NAME}"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  db_subnet_group_name = aws_db_subnet_group.db-group.name
  publicly_accessible = true
  tags = {
    Name = "PostgreSQL"
  }
  depends_on = [aws_db_subnet_group.db-group, aws_security_group.database-sg]
}