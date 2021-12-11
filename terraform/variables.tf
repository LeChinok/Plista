variable "region" {
  type        = string
  description = "Default AWS region"
  default     = "eu-west-3"
}

variable "vpc_id" {
  type        = string
  description = "VPC to deploy the EC2 instance"
  default     = "vpc-0acd8549c2ca007b6"
}

variable "access_key"{
  type        = string
  description = "AWS Acess key"
}

variable "secret_key"{
  type        = string
  description = "AWS Secret key"
}
