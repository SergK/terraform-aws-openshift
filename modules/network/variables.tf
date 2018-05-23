variable "platform_name" {}

variable "platform_cidr" {}

variable "private_cidrs" {
  type = "list"
}

variable "public_cidrs" {
  type = "list"
}

variable "operator_cidrs" {
  type = "list"
}

variable "public_access_cidrs" {
  type = "list"
}

data "aws_availability_zones" "available" {}
