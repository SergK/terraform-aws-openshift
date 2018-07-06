provider "aws" {
  region  = "${var.region}"
  version = "~> 1.25"

  assume_role {
    role_arn     = "${var.role_arn}"
    session_name = "terraform"
  }
}

provider "null" {
  version = "~> 1.0"
}
