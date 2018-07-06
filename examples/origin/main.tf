module "openshift_platform" {
  source = "../.."

  region                    = "${var.region}"
  role_arn                  = "${var.role_arn}"
  upstream                  = true
  platform_name             = "${var.platform_name}"
  key_pair_private_key_path = "${var.key_pair_private_key_path}"

  platform_cidr       = "${var.platform_cidr}"
  private_cidrs       = "${var.private_cidrs}"
  public_cidrs        = "${var.public_cidrs}"
  operator_cidrs      = "${var.operator_cidrs}"
  public_access_cidrs = "${var.public_access_cidrs}"

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

  platform_default_subdomain = "${var.platform_default_subdomain}"

  platform_secure_listener      = "${var.platform_secure_listener}"
  openshift_cluster_admin_users = "${var.openshift_cluster_admin_users}"
  openshift_inventory           = "${var.openshift_inventory}"

  openshift_major_version    = "${var.openshift_major_version}"
  platform_default_subdomain = "${var.platform_default_subdomain}"
}
