//output "instance_dns_name" {
//  value = aws_instance.ec2-webapp-1.public_dns
//}
//output "db_address" {
//  value = aws_db_instance.postgresql.address
//}
//output "db_endpoint" {
//  value = aws_db_instance.postgresql.endpoint
//}
//output "alb_address" {
//  value = aws_alb.alb.dns_name
//}
//output "dns_name" {
//  value = aws_route53_record.terraform.name
//}

output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "VPC id"
}

output "db_host" {
  value = aws_db_instance.postgresql.address
}

output "db_name" {
  value = aws_db_instance.postgresql.name
}

output "db_user" {
  value = aws_db_instance.postgresql.username
}

output "db_password" {
  value = aws_db_instance.postgresql.password
  sensitive = true
}

//output "eks_name" {
//  value = aws_eks_cluster.eks.name
//}

//
//output "endpoint" {
//  value = aws_eks_cluster.eks.endpoint
//}
//
//output "db_endpoint" {
//  value       = aws_db_instance.postgresql.endpoint
//  description = "Database endpoint"
//}
//
//output "db_address" {
//  value = aws_db_instance.postgresql.address
//}