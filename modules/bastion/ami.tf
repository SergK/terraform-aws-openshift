# FEXME: we can use dynamic AMI search but let's hardcode for now ami-4bf3d731
# data "aws_ami" "bastion" {
#   owners      = ["679593333241"]
#   most_recent = true
#
#   filter {
#     name   = "name"
#     values = ["CentOS Linux 7 x86_64 HVM EBS *"]
#   }
#
#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }
#
#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }
# }

