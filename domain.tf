module "domain" {
  source = "./modules/domain"

  platform_name   = "${var.platform_name}"
  platform_vpc_id = "${module.network.platform_vpc_id}"

  bastion_ip = "${module.infrastructure.bastion_public_ip}"

  platform_default_subdomain = "${var.platform_default_subdomain}"
  platform_public_lb_arn     = "${module.infrastructure.platform_public_lb_arn}"

  master_public_dns_name = "master.${var.platform_default_subdomain}"
  master_public_lb_arn   = "${module.infrastructure.master_public_lb_arn}"
}
