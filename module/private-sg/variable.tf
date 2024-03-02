variable "pvt-sg-name" {
  description = "Name of the private security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "pvt-sg-ports" {
  description = "List of ports to open for ingress traffic"
  type        = list(number)
}

variable "pvt_cidr_blocks" {
  description = "CIDR blocks to allow traffic from"
  type        = list(string)
}
variable "private-sg-protocol" {
  type        = list(string)
}