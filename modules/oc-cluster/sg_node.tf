resource "aws_security_group" "node" {
  name        = "${var.platform_name}-node"
  description = "Cluster node group for ${var.platform_name}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups = ["${var.bastion_sg_id}"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${map(
    "kubernetes.io/cluster/${var.platform_name}", "owned",
    "Name", "${var.platform_name}-node",
    "Role", "node",
    )}"

  vpc_id = "${var.platform_vpc_id}"
}
