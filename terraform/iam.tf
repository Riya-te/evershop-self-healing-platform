# ============================================================
# ResilientOps - IAM Configuration
# ============================================================
#
# The terraform-aws-modules/eks/aws module creates and manages:
# - EKS cluster IAM role
# - EKS managed node group IAM role
#
# Additional IAM permissions for AWS integrations can be added
# here as the project progresses.
# ============================================================


# ------------------------------------------------------------
# ECR Read Permissions for EKS Worker Nodes
# ------------------------------------------------------------

data "aws_iam_policy_document" "ecr_read" {
  statement {
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage"
    ]

    resources = [
      aws_ecr_repository.evershop.arn
    ]
  }
}


resource "aws_iam_policy" "ecr_read" {
  name        = "${var.cluster_name}-ecr-read"
  description = "Allows EKS nodes to pull Evershop images from ECR"

  policy = data.aws_iam_policy_document.ecr_read.json

  tags = {
    Project     = "ResilientOps"
    Environment = var.environment
  }
}


# ------------------------------------------------------------
# Attach ECR permissions to the EKS node role
# ------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "ecr_read" {
  for_each = module.eks.eks_managed_node_groups

  role = each.value.iam_role_name

  policy_arn = aws_iam_policy.ecr_read.arn
}