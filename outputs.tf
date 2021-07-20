output "instance_dns_name" {
  value = aws_instance.ec2-webapp-1.public_dns
}