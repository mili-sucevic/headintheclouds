# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.12"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.5"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
  }
  # Backend S3 Remote State Storage
  backend "s3" {
    bucket = "headintheclouds-tf-aws-eks"
    key    = "dev/aws-external-dns/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-aws-external-dns"
  }
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}

# Terraform HTTP Provider Block
provider "http" {
}