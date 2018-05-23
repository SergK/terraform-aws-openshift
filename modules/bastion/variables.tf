variable "platform_name" {}

variable "platform_vpc_id" {}

variable "operator_cidrs" {
  type = "list"
}

variable "public_access_cidrs" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "bastion_spot_price" {
  default = "0.01"
}

variable "public_subnet_ids" {
  type = "list"
}

variable "bastion_ami" {
  default = "ami-4bf3d731"
}

variable "bastion_instance_type" {
  default = "t2.micro"
}

variable "openshift_major_version" {
  default = "3.7"
}

variable "key_name" {}
