module "vpc" {
  source = "./module/vpc"
  vpc-cidr    = var.vpc-cidr
  instance-tenancy = var.instance-tenancy
  vpc-name = var.vpc-name
}
 module "public-subnets" {
  source = "./module/public-subnets"
  vpc_id = module.vpc.vpc_id
  public-subnets-cidr = var.public-subnets-cidr
  subnets-azs = var.subnets-azs
  pub-sub-name = var.pub-sub-name
 }

 module "private-subnets" {
  source = "./module/private-subnets"
  vpc_id = module.vpc.vpc_id
  private-subnets-cidr = var.private-subnets-cidr
  subnets-azs = var.subnets-azs
  pri-sub-name = var.pri-sub-name
 }

 module "eip" {
  source = "./module/eip"
  eip-domain = var.eip-domain
 }
 module "nat" {
  source = "./module/nat"
  elastic_ip_id = module.eip.elastic_ip_id
  public_subnet_id = element(module.public-subnets.public_subnet_ids, 0)
  nat_name = var.nat_name
 }
  module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id
  igw_name = var.igw_name
 }
  module "private-rt" {
  source = "./module/private-rt"
  vpc_id = module.vpc.vpc_id
  private-rt-name = var.private-rt-name
  destination-cidr = var.destination-cidr
  nat-id = module.nat.nat_gateway_id
  private_subnet_ids = module.private-subnets.private_subnet_ids
  vpc_peering_connection_id = module.vpc_peering.peering_connection_id
  existing_vpc_cidr_block = var.existing_vpc_cidr_block
 }
 module "public-rt" {
  source = "./module/public-rt"
  vpc_id = module.vpc.vpc_id
  public-rt-name = var.public-rt-name
  destination-cidr = var.destination-cidr
  igw-id = module.igw.internet_gateway_id
  public_subnet_ids = module.public-subnets.public_subnet_ids
  vpc_peering_connection_id = module.vpc_peering.peering_connection_id
  existing_vpc_cidr_block = var.existing_vpc_cidr_block
  #new_vpc_route_table_id = module.public-subnets.public_subnet_ids
  new_vpc_cidr_block = var.new_vpc_cidr_block
  existing_vpc_route_table_id = var.existing_vpc_route_table_id

 }
module "public-sg" {
  source       = "./module/public-sg"
  vpc_id       = module.vpc.vpc_id
  pub-sg-name  = var.pub-sg-name
  pub-sg-ports = var.pub-sg-ports
  cidr_blocks  = var.cidr_blocks
  public-sg-protocol = var.public-sg-protocol
  #public-sg-protocol = ["tcp"]
}

module "private-sg" {
  source           = "./module/private-sg"
  vpc_id           = module.vpc.vpc_id
  pvt-sg-name      = var.pvt-sg-name
  pvt-sg-ports     = var.pvt-sg-ports
  pvt_cidr_blocks = var.pvt_cidr_blocks
  #private-sg-protocol = var.private-sg-protocol
  private-sg-protocol = ["tcp"]

}

module "instances" {
  source             = "./module/instances"
  ami-id             = var.ami-id
  instance-type      = var.instance-type
  public_subnet_ids  = module.public-subnets.public_subnet_ids
  private_subnet_ids = module.private-subnets.private_subnet_ids
  bastion-instance-name = var.bastion-instance-name
  private-instance-name = var.private-instance-name
  key-name           = var.key-name
  pub_sg_id          = module.public-sg.pub_sg_id  // Pass the output of public-sg module
  pvt_sg_id          = module.private-sg.pvt_sg_id // Pass the output of private-sg module
}


module "alb" {
source = "./module/alb"
alb_name = var.alb_name
internal = var.internal
security_groups = module.public-sg.pub_sg_id
subnets = module.public-subnets.public_subnet_ids
target_group_name = var.target_group_name
target_group_port = var.target_group_port
target_group_protocol = var.target_group_protocol
vpc_id = module.vpc.vpc_id
health_check_path = var.health_check_path
health_check_protocol = var.health_check_protocol
health_check_port = var.health_check_port
health_check_interval = var.health_check_interval
health_check_timeout = var.health_check_timeout
health_check_healthy_threshold = var.health_check_healthy_threshold
health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
listener_port = var.listener_port
listener_protocol = var.listener_protocol
private_instance_ids = module.instances.private_instance_ids
}


module "vpc_peering" {
  source = "./module/VPC-Peering"
  // Input variables for the module
  peer_owner_id                        = var.peer_owner_id
  peer_vpc_id                          = var.peer_vpc_id
  vpc_id                               = module.vpc.vpc_id
  auto_accept                          = var.auto_accept
  peering_tag                          = var.peering_tag
  accepter_allow_remote_vpc_dns_resolution = var.accepter_allow_remote_vpc_dns_resolution
  requester_allow_remote_vpc_dns_resolution = var.requester_allow_remote_vpc_dns_resolution
  peering_connection_id                = module.vpc_peering.peering_connection_id
}