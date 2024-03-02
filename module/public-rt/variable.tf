variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "public-rt-name" {
  type    = string
}
variable "destination-cidr" {
  type    = string
}
variable "igw-id" {
  description = "Internet Gateway ID"
  type        = string
}
variable "public_subnet_ids" {
  type    = list(string)
}

variable "existing_vpc_cidr_block" {
  type    = string
}

variable "vpc_peering_connection_id" {
  type    = string
}


variable "existing_vpc_route_table_id" {
  description = "ID of the route table in VPC Two"
  type        = string
}
variable "new_vpc_cidr_block" {
  type    = string
}
