variable "platform_name" {}

variable "platform_cidr" {
  type = "string"
}

variable "private_cidrs" {
  type = "list"
}

variable "public_cidrs" {
  type = "list"
}

variable "operator_cidrs" {
  type        = "list"
  description = "CIDRS that is allowed from which master api can be accessed"
}

variable "public_access_cidrs" {
  type        = "list"
  description = "CIDRS that is allowed from which public users can access served services in the cluster"
}

data "aws_availability_zones" "available" {}
