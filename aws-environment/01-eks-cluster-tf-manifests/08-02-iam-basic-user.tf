# AWS IAM User - Basic User (Without AWS Console Access)
resource "aws_iam_user" "basic_user" {
  name          = "${local.name}-eks-admin-02"
  path          = "/"
  force_destroy = true
  tags          = local.common_tags
}

# AWS IAM User Policy - EKS Full Access
resource "aws_iam_user_policy" "basic_user_eks_policy" {
  name = "${local.name}-eks-full-access-policy"
  user = aws_iam_user.basic_user.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}