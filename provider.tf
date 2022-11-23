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
  access_key = "<replace with your access key>"
  secret_key = "<replace with your secret key>"
}

