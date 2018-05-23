data "aws_vpc" "platform" {
  id = "${var.platform_vpc_id}"
}

data "aws_subnet" "public" {
  count = "${length(var.public_subnet_ids) <= 0 ? 0 : length(var.public_subnet_ids)}"
  id    = "${element(var.public_subnet_ids, count.index)}"
}
