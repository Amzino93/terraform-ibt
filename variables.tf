variable "cider_block_subnet" {
  description = "the CIDR block of subnet"
  type = string
}
variable "cider_block_vpc" {
  description = "the CIDR block of subnet"
  type = string
}
variable "organisation" {
  description = "my organisation which IBT"
}

variable "environment" {
  description = "Environment for my VM"
}

variable "instance_type" {
  description = "size of the VM"
}
