module "infrastructure" {
  source = "./modules/infrastructure"

  platform_cidr = "${var.platform_cidr}"
  platform_name = "${var.platform_name}"

  platform_vpc_id    = "${module.network.platform_vpc_id}"
  public_subnet_ids  = ["${module.network.public_subnet_ids}"]
  private_subnet_ids = ["${module.network.private_subnet_ids}"]

  operator_cidrs      = ["${var.operator_cidrs}"]
  public_access_cidrs = ["${var.public_access_cidrs}"]

  master_public_dns_name     = "master.${var.platform_default_subdomain}"
  platform_default_subdomain = "${var.platform_default_subdomain}"

  compute_node_count = "${var.compute_node_count}"
  infra_node_count   = "${var.infra_node_count}"

  master_count         = "${var.master_count}"
  master_spot_price    = "${var.master_spot_price}"
  master_instance_type = "${var.master_instance_type}"

  compute_node_count         = "${var.compute_node_count}"
  compute_node_spot_price    = "${var.compute_node_spot_price}"
  compute_node_instance_type = "${var.compute_node_instance_type}"

  infra_node_count         = "${var.infra_node_count}"
  infra_node_spot_price    = "${var.infra_node_spot_price}"
  infra_node_instance_type = "${var.infra_node_instance_type}"

  key_pair_private_key = "${file(var.key_pair_private_key_path == "" ? "${path.module}/empty.txt" : var.key_pair_private_key_path)}"

  platform_secure_listener      = "${var.platform_secure_listener}"
  openshift_cluster_admin_users = "${var.openshift_cluster_admin_users}"
  openshift_inventory           = "${var.openshift_inventory}"

  upstream                = "${var.upstream}"
  openshift_major_version = "${var.openshift_major_version}"
  rh_subscription_pool_id = "${var.rh_subscription_pool_id}"
  rhn_username            = "${var.rhn_username}"
  rhn_password            = "${var.rhn_password}"
}
