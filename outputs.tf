output "instance_dns_name" {
  value = aws_instance.ec2-webapp-1.public_dns
}
output "db_address" {
  value = aws_db_instance.postgresql.address
}
output "db_endpoint" {
  value = aws_db_instance.postgresql.endpoint
}
