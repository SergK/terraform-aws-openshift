output "bastion_instance_id" {
  value = "${aws_instance.bastion.id}"
}

output "bastion_ssh_user" {
  value = "${local.bastion_ssh_user}"
}

output "bastion_public_dns" {
  value = "${aws_instance.bastion.public_dns}"
}

output "bastion_public_ip" {
  value = "${aws_instance.bastion.public_ip}"
}

output "platform_public_lb_arn" {
  value = "${aws_lb.platform_public.arn}"
}

output "master_public_lb_arn" {
  value = "${aws_lb.master_public.arn}"
}

output "master_lb_arn" {
  value = "${aws_elb.master.arn}"
}

output "master_lb_name" {
  value = "${aws_elb.master.name}"
}

output "master_private_dns_name" {
  value = "master.${var.platform_name}.internal"
}

output "platform_private_key" {
  sensitive = true
  value     = "${data.tls_public_key.platform.private_key_pem}"
}

output "master_public_lb_addrs" {
  value = "${data.dns_a_record_set.master_public_lb.addrs}"
}

output "platform_public_lb_addrs" {
  value = "${data.dns_a_record_set.platform_public_lb.addrs}"
}
