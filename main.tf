module "network" {
  source = "./modules/network"

  platform_name = "${var.platform_name}"

  platform_cidr       = "${var.platform_cidr}"
  private_cidrs       = "${var.private_cidrs}"
  public_cidrs        = "${var.public_cidrs}"
  operator_cidrs      = "[${var.operator_cidrs}]"
  public_access_cidrs = "[${var.public_access_cidrs}]"
}

module "bastion" {
  source              = "./modules/bastion"
  platform_name       = "${var.platform_name}"
  platform_vpc_id     = "${module.network.platform_vpc_id}"
  operator_cidrs      = ["${var.operator_cidrs}"]
  public_access_cidrs = ["${var.public_access_cidrs}"]
  public_subnet_ids   = ["${module.network.public_subnet_ids}"]
  key_name            = "${var.key_name}"
}

module "oc-cluster" {
  source = "./modules/oc-cluster"

  platform_name = "${var.platform_name}"

  platform_vpc_id     = "${module.network.platform_vpc_id}"
  public_subnet_ids   = ["${module.network.public_subnet_ids}"]
  private_subnet_ids  = ["${module.network.private_subnet_ids}"]
  operator_cidrs      = ["${var.operator_cidrs}"]
  public_access_cidrs = ["${var.public_access_cidrs}"]

  bastion_sg_id = "${module.bastion.bastion_sg_id}"

  # master_public_dns_name     = "master.${var.platform_default_subdomain}"
  # platform_default_subdomain = "${var.platform_default_subdomain}"

  infra_node_count         = "${var.infra_node_count}"
  infra_node_spot_price    = "${var.infra_node_spot_price}"
  infra_node_instance_type = "${var.infra_node_instance_type}"
  infra_node_root_vol_size = "${var.infra_node_root_vol_size}"
  master_count             = "${var.master_count}"
  master_spot_price        = "${var.master_spot_price}"
  master_instance_type     = "${var.master_instance_type}"
  master_root_vol_size     = "${var.master_root_vol_size}"
  key_name                 = "${var.key_name}"
  openshift_major_version  = "${var.openshift_major_version}"
}
