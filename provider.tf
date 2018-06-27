provider "aws" {
  region  = "${var.region}"
  version = "~> 1.25"
}

provider "null" {
  version = "~> 1.0"
}
