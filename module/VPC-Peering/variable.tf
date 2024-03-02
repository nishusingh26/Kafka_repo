# variable "peer_owner_id" {
#   type = string
# }

# variable "peer_vpc_id" {
#   type = string
# }

# variable "vpc_id" {
#   type = string
# }

# variable "accepter_allow_remote_vpc_dns_resolution" {
#   type    = bool
# }

# variable "requester_allow_remote_vpc_dns_resolution" {
#   type    = bool
# }

# variable "peering-tag" {
#   type    = string
# }

# variable "auto_accept" {
#   type    = string
# }

# variable "peering_connection_id" {
#   type = string
# }



variable "peer_owner_id" {
  description = "The AWS account ID of the owner of the peer VPC."
  type        = string
}

variable "peer_vpc_id" {
  description = "The ID of the peer VPC with which you are creating the VPC peering connection."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the requester VPC."
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

variable "peering_connection_id" {
  description = "The ID of the VPC peering connection."
  type        = string
}
