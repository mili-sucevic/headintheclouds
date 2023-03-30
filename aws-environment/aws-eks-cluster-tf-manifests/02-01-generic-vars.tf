# Input Variables
## AWS Region
variable "aws_region" {
  description = "Specify the region where you want to create your AWS resources"
  type        = string
}

# Environment Variable
variable "environment" {
  description = "Set an environment variable that will be used as a prefix for your infrastructure"
  type        = string
}

# Business Division
variable "business_segment" {
  description = "Specify the business segment within the organization that this infrastructure is associated with"
  type        = string
}
