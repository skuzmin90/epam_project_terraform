output "ecr_access_key" {
  value       = aws_iam_access_key.ecr.id
  description = "AWS_ACCESS_KEY to publish to ECR"
}

output "ecr_secret_key" {
  value       = aws_iam_access_key.ecr.secret
  description = "AWS_SECRET_ACCESS_KEY to upload to the ECR"
  sensitive   = true
}

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