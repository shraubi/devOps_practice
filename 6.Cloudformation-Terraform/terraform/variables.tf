variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "key_name" {
  description = "Name of an existing EC2 KeyPair to enable SSH access"
  type        = string
  default     = "aloho"
}

variable "vpc_name" {
  default = "VPC"
}
