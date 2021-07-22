resource "aws_db_instance" "postgresql" {
  instance_class = "db.t2.micro"
  engine = "postgresql"
  engine_version = "10.17"
  allocated_storage = 10
  max_allocated_storage = 25
  name = "weather"
  username = "epam"
  password = "SSpassword"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  tags = {
    Name = "PostgreSQL"
  }
}