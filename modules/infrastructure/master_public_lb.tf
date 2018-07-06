resource "aws_lb" "master_public" {
  name     = "${var.platform_name}-master-public-lb"
  internal = false
  subnets  = ["${var.public_subnet_ids}"]

  security_groups = [
    "${aws_security_group.master_public.id}",
  ]

  enable_cross_zone_load_balancing = true

  tags = "${map(
    "kubernetes.io/cluster/${var.platform_name}", "owned"
  )}"
}

resource "aws_lb_listener" "master_public" {
  load_balancer_arn = "${aws_lb.master_public.arn}"
  port              = "8443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${aws_acm_certificate_validation.openshift-cluster.certificate_arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.master_public.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "master_public" {
  name                 = "${var.platform_name}-master-public"
  port                 = 8443
  protocol             = "HTTPS"
  vpc_id               = "${var.platform_vpc_id}"
  deregistration_delay = 20

  stickiness = {
    type = "lb_cookie"
  }
}

resource "aws_lb_listener" "master_public_insecure" {
  load_balancer_arn = "${aws_lb.master_public.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.master_public_insecure.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "master_public_insecure" {
  name                 = "${var.platform_name}-master-insecure"
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 20
  vpc_id               = "${var.platform_vpc_id}"
}

data "dns_a_record_set" "master_public_lb" {
  host = "${aws_lb.master_public.dns_name}"
}
