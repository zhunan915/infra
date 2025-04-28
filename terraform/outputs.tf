output "vpc_creator_role_arn" {
  description = "ARN of the created VPC Creator Role"
  value       = aws_iam_role.vpc_creator_role.arn
}

output "vpc_creator_role_name" {
  description = "Name of the created VPC Creator Role"
  value       = aws_iam_role.vpc_creator_role.name
}