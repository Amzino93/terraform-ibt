terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "remote" {
    organization = "ibt-learning"
    workspaces {
      name = "ibt-terraform-infra"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA2A4DHKVA2EJS4IV7"
secret_key = "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"
}
