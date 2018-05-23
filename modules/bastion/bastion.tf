# resource "aws_instance" "bastion" {
resource "aws_spot_instance_request" "bastion" {
  # ami                         = "${data.aws_ami.bastion.id}"
  ami                         = "${var.bastion_ami}"
  instance_type               = "${var.bastion_instance_type}"
  spot_price                  = "${var.bastion_spot_price}"
  subnet_id                   = "${element(data.aws_subnet.public.*.id, 0)}"
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.bastion.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.bastion.name}"
  user_data                   = "${data.template_file.bastion_init.rendered}"

  tags = "${map(
    "kubernetes.io/cluster/${var.platform_name}", "owned",
    "Name", "${var.platform_name}-bastion",
    "Role", "bastion"
  )}"
}

resource "aws_iam_instance_profile" "bastion" {
  name = "${var.platform_name}-bastion-profile"
  role = "${aws_iam_role.bastion.name}"
}

data "template_file" "bastion_init" {
  template = "${file("${path.module}/resources/origin-bastion-init.yml")}"

  vars {
    openshift_major_version = "${var.openshift_major_version}"
  }
}
