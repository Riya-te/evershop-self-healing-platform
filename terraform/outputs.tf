output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "EKS cluster ARN"
  value       = module.eks.cluster_arn
}

output "eks_cluster_status" {
  description = "EKS cluster status"
  value       = module.eks.cluster_status
}

output "eks_node_group_arn" {
  description = "EKS managed node group ARN"
  value = try(
    module.eks.eks_managed_node_groups["resilientops_nodes"].node_group_arn,
    null
  )
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.evershop.repository_url
}