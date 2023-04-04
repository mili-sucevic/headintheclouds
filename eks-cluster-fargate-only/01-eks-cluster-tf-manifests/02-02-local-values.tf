# Define Local Values
locals {
  owners           = var.business_segment
  environment      = var.environment
  name             = "${var.business_segment}-${var.environment}"
  eks_cluster_name = "${local.name}-${var.cluster_name}"

  ## Group owners and environment
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}