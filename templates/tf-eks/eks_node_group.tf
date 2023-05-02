resource "aws_eks_node_group" "eks_node_group" {
    cluster_name = aws_eks_cluster.eks_cluster.name
    node_group_name = format("%s-nodegroup", var.cluster_name)
    node_role_arn = aws_iam_role.eks_node_role.arn
    subnet_ids = var.subnet_ids
    instance_types = var.instance_types

    scaling_config {
      desired_size = var.desired_size
      max_size     = var.max_size
      min_size     = var.min_size
    }

    depends_on = [
      aws_iam_role_policy_attachment.eks_nodegroup_policy,
      aws_iam_role_policy_attachment.eks_nodegroup_cni_policy,
      aws_iam_role_policy_attachment.eks_nodegroup_ec2_containerregistryread
    ]
    tags = var.base_tags
}

resource "aws_iam_role" "eks_node_role" {
  name = format("%s-eks-node-role", var.cluster_name)
  assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_nodegroup_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "eks_nodegroup_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "eks_nodegroup_ec2_containerregistryread" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node_role.name
}