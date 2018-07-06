variable "region" {}

variable "platform_name" {
  description = "The name of the cluster that is used for tagging some resources"
}

variable "key_pair_private_key_path" {
  description = "AWS key pair that is used for instances of the cluster includes the bastion"
}

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

variable "master_count" {}

variable "master_spot_price" {}

variable "master_instance_type" {}

variable "compute_node_count" {}

variable "compute_node_spot_price" {}

variable "compute_node_instance_type" {}

variable "infra_node_count" {}

variable "infra_node_spot_price" {}

variable "infra_node_instance_type" {}

variable "openshift_inventory" {}

variable "platform_secure_listener" {}

variable "openshift_cluster_admin_users" {
  type = "list"
}

variable "upstream" {
  description = "Sets true if you want to install Origin."
}

variable "rh_subscription_pool_id" {
  description = "Red Hat subscription pool id for OpenShift Container Platform"
  default     = ""
}

variable "rhn_username" {
  description = "Red Hat Network login username for registration system of the OpenShift Container Platform cluster"
  default     = ""
}

variable "rhn_password" {
  description = "Red Hat Network login password for registration system of the OpenShift Container Platform cluster"
  default     = ""
}

variable "openshift_major_version" {}

# Domains

variable "platform_default_subdomain" {
  description = "Public DNS subdomain for access to services served in the cluster"
}
