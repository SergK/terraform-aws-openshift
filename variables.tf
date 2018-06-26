## Terraform specific
variable "region" {
  description = "The region to apply these templates to (e.g. us-east-1)"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Profile to use to running terraform"
}

## Network options
variable "platform_name" {
  default = "openshift"
}

variable "platform_cidr" {
  default = "10.0.0.0/16"
}

variable "private_cidrs" {
  type    = "list"
  default = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
}

variable "public_cidrs" {
  type    = "list"
  default = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
}

variable "operator_cidrs" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "CIDRS that is allowed from which master api can be accessed"
}

variable "public_access_cidrs" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "CIDRS that is allowed from which public users can access served services in the cluster"
}

## Access to nodes
variable "key_name" {
  default = "amazon_id_rsa"
}

## Infra node configuration
variable "infra_node_count" {
  default = 2
}

variable "infra_node_spot_price" {
  default     = "0.04"
  description = "When set to empty will spin-up instance on-demand"
}

variable "infra_node_instance_type" {
  default = "r4.large"
}

variable "infra_node_root_vol_size" {
  default = "15"
}

variable "infra_node_glusterfs_vol_size" {
  default = "20"
}

## Master node configuration
variable "master_count" {
  default = 1
}

variable "master_spot_price" {
  default     = "0.04"
  description = "When set to empty will spin-up instance on-demand"
}

variable "master_instance_type" {
  default = "r4.large"
}

variable "master_root_vol_size" {
  default = "15"
}

variable "master_glusterfs_vol_size" {
  default = "20"
}

## Openshift config
variable "openshift_major_version" {
  default = "3.7"
}
