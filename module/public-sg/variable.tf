variable "pub-sg-name" {
  description = "Name of the public security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
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
  description = "Protocol to allow for ingress traffic"
  type        = string
}
