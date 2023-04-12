# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.14"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.11"
    }    
  }
  # Backend S3 Remote State Storage
  backend "s3" {
    bucket = "headintheclouds-tf-aws-eks"
    key    = "dev/aws-lbc-ingress/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-aws-lbc-ingress"    
  }
}