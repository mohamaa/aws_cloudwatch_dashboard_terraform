terraform {
  backend "s3" {
    bucket = "<s3 bucket to store terraform state files>"
    key    = "cloudwatch-dashboards.tfstate"
    region = "<region>"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "<aws_profile>"
  }
}

# Specify the provider and access details
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile = "${var.aws_profile}"
  region = "${var.aws_region}"
}
