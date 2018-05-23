terraform {
  # backend "s3" {
  #   bucket         = "bucketname"
  #   key            = "path"
  #   region         = "us-east-1"
  #   acl            = "bucket-owner-full-control"
  #   dynamodb_table = "locktablename"
  # }
  backend "local" {}
}

provider "aws" {
  version = "~> 1.12.0"
  region  = "${var.region}"
  profile = "${var.aws_profile}"
}

provider "template" {
  version = "~> 1.0.0"
}

provider "terraform" {
  version = "~> 1.0.1"
}
