module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.24.2"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  endpoint_public_access  = true
  endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  # EKS Add-ons
  addons = {
    aws-ebs-csi-driver = {
      most_recent              = true
      service_account_role_arn = module.ebs_csi_irsa.iam_role_arn
    }
  }

  eks_managed_node_groups = {
    resilientops_nodes = {
      name = "${var.cluster_name}-nodes"

      instance_types = var.node_instance_types

      min_size     = var.node_min_size
      desired_size = var.node_desired_size
      max_size     = var.node_max_size

      disk_size = 20

      ami_type = "AL2023_x86_64_STANDARD"

      subnet_ids = module.vpc.private_subnets

      labels = {
        Project     = "ResilientOps"
        Environment = var.environment
      }
    }
  }

  tags = {
    Project     = "ResilientOps"
    Environment = var.environment
  }
}