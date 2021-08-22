output "ecr_arn" {
  value       = aws_ecr_repository.github-actions.arn
}

output "db_host" {
  value       = aws_db_instance.postgresql.address
  description = "DB host"
}

output "db_name" {
  value       = aws_db_instance.postgresql.name
  description = "DB name"
}

output "db_user" {
  value       = aws_db_instance.postgresql.username
  description = "DB user"
}

output "db_password" {
  value       = aws_db_instance.postgresql.password
  sensitive   = true
  description = "DB password"
}