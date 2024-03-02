variable "vpc-cidr" {
  description = "CIDR block for VPC"
  type = string
}
variable "instance-tenancy" {
  description = "Instance Tenancy value"
  type = string
}
variable "vpc-name" {
  description = "vpc name"
  type = string
}
variable "public-subnets-cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}
variable "subnets-azs" {
  description = "Availability zones for subnets"
  type        = list(string)
}
variable "pub-sub-name" {
  description = "Public Subnet Name"
  type        = list(string)
}
variable "private-subnets-cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}
variable "pri-sub-name" {
  description = "Privat Subnet Name"
  type        = list(string)
}
variable "nat_name" {
  type    = string
}
variable "eip-domain" {
  description = "Elastic IP domain"  
  type = string
}
variable "igw_name" {
  type    = string
}
variable "private-rt-name" {
  type    = string
}
variable "destination-cidr" {
  type    = string
}
variable "public-rt-name" {
  type    = string
}

variable "existing_vpc_cidr_block" {
  type    = string
}

variable "ami-id" {
  description = "AMI ID for the instance"
  type        = string
}
variable "instance-type" {
  description = "Instance type"
  type        = string
}
variable "key-name" {
  description = "PEM Key Name"  
  type        = string
}
variable "bastion-instance-name" {
  description = "Bastion Instance Name"
  type        = string
}
variable "private-instance-name" {
  description = "Private Instance Name"
  type        = list(string)
}

## pub-SG

variable "pub-sg-name" {
  description = "Name of the public security group"
  type        = string
}

variable "pub-sg-ports" {
  description = "List of ports to open for ingress traffic"
  type        = list(number)
}

variable "cidr_blocks" {
  description = "CIDR blocks to allow traffic from"
  type        = list(string)
}


variable "public-sg-protocol" {
  type        = string
}

## pvt-SG

variable "pvt-sg-name" {
  description = "Name of the private security group"
  type        = string
}

variable "pvt-sg-ports" {
  description = "List of ports to open for ingress traffic"
  type        = any
}
variable "pvt_cidr_blocks" {
  type        = any
}

variable "target_group_name" {
  type        = string
}

variable "target_group_port" {
  type        = number
}

variable "target_group_protocol" {
  type        = any
}

variable "health_check_path" {
  type        = any
}

variable "health_check_protocol" {
  type        = any
}

variable "health_check_port" {
  type        = any
}

variable "health_check_interval" {
  type        = number
}

variable "health_check_timeout" {
  type        = number
}

variable "health_check_healthy_threshold" {
  type        = any
}

variable "health_check_unhealthy_threshold" {
  type        = any
}

variable "listener_port" {
  type        = any
}

variable "listener_protocol" {
  type        = any
}


variable "alb_name" {
  type        = any
}

variable "internal" {
  type        = any
}

#+++++++++++++++++++++Peering vartiables+++++++++++++++++

variable "peer_owner_id" {
  description = "The AWS account ID of the owner of the peer VPC."
  type        = string
}

variable "peer_vpc_id" {
  description = "The ID of the peer VPC with which you are creating the VPC peering connection."
  type        = string
}


variable "auto_accept" {
  description = "Whether or not to automatically accept the peering connection (true/false)."
  type        = bool
}

variable "peering_tag" {
  description = "The name tag for the peering connection."
  type        = string
}

variable "accepter_allow_remote_vpc_dns_resolution" {
  description = "Whether or not the accepter VPC can resolve DNS queries between the requester VPC and the accepter VPC."
  type        = bool
}

variable "requester_allow_remote_vpc_dns_resolution" {
  description = "Whether or not the requester VPC can resolve DNS queries between the requester VPC and the accepter VPC."
  type        = bool
}

variable "existing_vpc_route_table_id" {
  description = "ID of the route table in VPC Two"
  type        = string
}
variable "new_vpc_cidr_block" {
  type    = string
}