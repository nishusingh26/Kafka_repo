variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "private-rt-name" {
  type    = string
}
variable "destination-cidr" {
  type    = string
}
variable "nat-id" {
  description = "NAT Gateway ID"
  type        = string
}
variable "private_subnet_ids" {
  type    = list(string)
}


variable "existing_vpc_cidr_block" {
  type    = string
}

variable "vpc_peering_connection_id" {
  type    = string
}