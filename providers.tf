terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
  backend "s3" {
    bucket         = "terafform-backend"
    key            = "global/s3/terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = "terraform-lock"
    encrypt        = true
    shared_credentials_file = "/home/ubuntu/.aws/credentials"
    profile                 = "default"
  }
}
provider "aws" {
  region     = local.aws_region
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  profile                 = "default"
}
