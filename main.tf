# created a new VPC
resource "aws_vpc" "ibt-development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ibt-vpc-1"
  }
}

variable "cider_block" {
  description = "the CIDR block of subnet"
  default = "10.0.10.0/24"
  type = string
}

resource "aws_subnet" "ibt-development-subnet-1" {
  vpc_id            = aws_vpc.ibt-development-vpc.id
  cidr_block        = var.cider_block
  availability_zone = "us-west-2a"
  tags = {
    Name = "ibt-development-subnet"
  }
}

# Sourced an existing VPC (default VPC in region)
data "aws_vpc" "vpc_default" {
  default = true
}

resource "aws_subnet" "ibt-development-subnet-2" {
  vpc_id = data.aws_vpc.vpc_default.id
  cidr_block = "172.31.128.0/20"
  availability_zone = "us-west-2d"
  tags = {
    Name = "ibt-default-subnet"
  }
}

output "ibt-development-vpc" {
  value = aws_vpc.ibt-development-vpc.id
}
