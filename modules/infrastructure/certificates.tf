data "aws_route53_zone" "wildcard_zone" {
  name         = "${var.platform_default_subdomain}"
  private_zone = false
}

resource "aws_acm_certificate" "openshift-cluster" {
  domain_name = "${var.platform_default_subdomain}"

  subject_alternative_names = [
    "master.${var.platform_default_subdomain}",
    "*.${var.platform_default_subdomain}",
  ]

  validation_method = "DNS"
}

resource "aws_route53_record" "openshift-cluster_cert-verification" {
  count   = "2"
  name    = "${lookup(aws_acm_certificate.openshift-cluster.domain_validation_options[count.index], "resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.openshift-cluster.domain_validation_options[count.index], "resource_record_type")}"
  zone_id = "${data.aws_route53_zone.wildcard_zone.id}"
  records = ["${lookup(aws_acm_certificate.openshift-cluster.domain_validation_options[count.index], "resource_record_value")}"]
  ttl     = 300
}

resource "aws_acm_certificate_validation" "openshift-cluster" {
  certificate_arn = "${aws_acm_certificate.openshift-cluster.arn}"

  validation_record_fqdns = [
    "${aws_route53_record.openshift-cluster_cert-verification.*.fqdn}",
  ]
}
