module "ibt-subnet" {
  source = "./modules/subnet"
  organisation = "ibt"
  cider_block_vpc = "10.0.0.0/16"
  cider_block_subnet = "10.0.30.0/24"
}

module "ibt-dev-server" {
  source = "./modules/server"
  environment = "dev"
  organisation = "ibt"
  instance_type = "t2.micro"
  subnet-id = module.ibt-subnet.subnet.id
  security-group-id = module.ibt-subnet.security-group.id
}

#module "ibt-staging-server" {
#  source = "./modules/server"
#  environment = "staging"
#  organisation = "ibt"
#  instance_type = "t2.micro"
#  subnet-id = module.ibt-subnet.subnet.id
#  security-group-id = module.ibt-subnet.security-group.id
#}
#
#module "ibt-prod-server" {
#  source = "./modules/server"
#  environment = "prod"
#  organisation = "ibt"
#  instance_type = "t2.micro"
#  subnet-id = module.ibt-subnet.subnet.id
#  security-group-id = module.ibt-subnet.security-group.id
#}
#
#module "ibt-uat-server" {
#  source = "./modules/server"
#  environment = "uat"
#  organisation = "ibt"
#  instance_type = "t2.micro"
#  subnet-id = module.ibt-subnet.subnet.id
#  security-group-id = module.ibt-subnet.security-group.id
#}
