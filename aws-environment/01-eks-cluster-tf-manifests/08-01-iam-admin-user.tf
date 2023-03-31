# AWS IAM User - Admin User (Full AWS Access)
resource "aws_iam_user" "admin_user" {
  name          = "${local.name}-eks-admin-01"
  path          = "/"
  force_destroy = true
  tags          = local.common_tags
}

# Admin Access Policy
resource "aws_iam_user_policy_attachment" "admin_user" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}