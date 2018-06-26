variable "platform_name" {}

variable "platform_vpc_id" {}

variable "key_name" {}

variable "bastion_sg_id" {}

## Infra node configuration
variable "infra_node_instance_type" {}

variable "infra_node_spot_price" {}

variable "infra_node_count" {
  default = 1
}

variable "infra_node_ami" {
  default = "ami-4bf3d731"
}

variable "infra_node_root_vol_size" {
  default = "15"
}

## Master node configuration
variable "master_instance_type" {}

variable "master_spot_price" {}

variable "master_count" {
  default = 1
}

variable "master_ami" {
  default = "ami-4bf3d731"
}

variable "master_root_vol_size" {
  default = "15"
}

## Network options
variable "operator_cidrs" {
  type = "list"
}

variable "public_access_cidrs" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "private_subnet_ids" {
  type = "list"
}

variable "public_subnet_ids" {
  type = "list"
}

## Openshift configuration
variable "openshift_major_version" {}
