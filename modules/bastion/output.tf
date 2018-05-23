output "bastion_instance_id" {
  # value = "${aws_instance.bastion.id}"
  value = "${aws_spot_instance_request.bastion.id}"
}

output "bastion_sg_id" {
  value = "${aws_security_group.bastion.id}"
}
