resource "aws_eks_cluster" "eks_cluster" {
    name       = var.cluster_name
    role_arn   = aws_iam_role.eks_role.arn

    vpc_config {
        subnet_ids = var.subnet_ids
        security_group_ids = var.security_group_ids
    }

    depends_on = [
      aws_iam_role_policy_attachment.eks_policy
    ]

    version    = var.k8s_version
    tags       = var.base_tags
}

resource "aws_iam_role" "eks_role" {
  name = format("%s-eks-service-role", var.cluster_name)

  assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
            Effect = "Allow"
            Principal = {
                Service = "eks.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}