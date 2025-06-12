output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "alb_security_group_id" {
  description = "The ID of the ALB security group"
  value       = module.alb_sg.security_group_id
}

output "app_security_group_id" {
  description = "The ID of the application security group"
  value       = module.app_sg.security_group_id
}

output "db_security_group_id" {
  description = "The ID of the database security group"
  value       = module.db_sg.security_group_id
}

output "alb_security_group_name" {
  description = "The name of the ALB security group"
  value       = module.alb_sg.security_group_name
}

output "app_security_group_name" {
  description = "The name of the application security group"
  value       = module.app_sg.security_group_name
}

output "db_security_group_name" {
  description = "The name of the database security group"
  value       = module.db_sg.security_group_name
} 