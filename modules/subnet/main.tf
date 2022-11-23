# created a new VPC
resource "aws_vpc" "ibt-vpc" {
  cidr_block = var.cider_block_vpc
  tags = {
    Name = "${var.organisation}-vpc"
  }
}

# created a new subnet
resource "aws_subnet" "ibt-subnet-1" {
  vpc_id            = aws_vpc.ibt-vpc.id
  cidr_block        = var.cider_block_subnet
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.organisation}-subnet"
  }
}

resource "aws_default_security_group" "ibt-security-group" {
  vpc_id = aws_vpc.ibt-vpc.id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["99.245.132.14/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name = "${var.organisation}-security-group"
  }
}

resource "aws_internet_gateway" "ibt-internet-gateway" {
  vpc_id = aws_vpc.ibt-vpc.id
  tags = {
    Name = "${var.organisation}-internet-gateway"
  }
}

resource "aws_default_route_table" "ibt-route-table" {
  default_route_table_id = aws_vpc.ibt-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ibt-internet-gateway.id
  }
  tags = {
    Name = "${var.organisation}-route-table"
  }
}
