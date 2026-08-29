# ResilientOps Terraform configuration
#
# Infrastructure is organized into:
# - providers.tf : Terraform and AWS provider
# - variables.tf : Input variables
# - vpc.tf       : VPC and networking
# - eks.tf       : EKS cluster and managed node group
# - ecr.tf       : ECR repository
# - iam.tf       : Additional IAM configuration
# - outputs.tf   : Terraform outputs
#
# Terraform automatically loads all .tf files in this directory.