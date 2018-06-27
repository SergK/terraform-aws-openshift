variable "platform_name" {}

variable "platform_vpc_id" {}

variable "public_subnet_ids" {
  type = "list"
}

variable "private_subnet_ids" {
  type = "list"
}

variable "operator_cidrs" {
  type = "list"
}

variable "public_access_cidrs" {
  type = "list"
}

variable "master_public_dns_name" {}

variable "platform_default_subdomain" {}

variable "platform_secure_listener" {}

variable "key_pair_private_key" {}

variable "openshift_major_version" {}

variable "openshift_cluster_admin_users" {
  type = "list"
}

variable "upstream" {}

variable "rhn_username" {}
variable "rhn_password" {}
variable "rh_subscription_pool_id" {}

variable "openshift_inventory" {}

variable "master_count" {}

variable "master_spot_price" {}

variable "master_instance_type" {}

variable "compute_node_count" {}

variable "compute_node_spot_price" {}

variable "compute_node_instance_type" {}

variable "infra_node_count" {}

variable "infra_node_spot_price" {}

variable "infra_node_instance_type" {}
