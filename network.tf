module "network" {
  source = "./modules/network"

  platform_name       = "${var.platform_name}"
  platform_cidr       = "${var.platform_cidr}"
  private_cidrs       = "${var.private_cidrs}"
  public_cidrs        = "${var.public_cidrs}"
  operator_cidrs      = "[${var.operator_cidrs}]"
  public_access_cidrs = "[${var.public_access_cidrs}]"
}
