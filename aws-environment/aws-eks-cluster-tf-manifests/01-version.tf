# Terraform Block
terraform {
  required_version = ">= 1.0" 
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  # Backend S3 Remote State Storage
  backend "s3" {
    bucket = "headintheclouds-terraform-aws-eks"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-eks-cluster"
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
