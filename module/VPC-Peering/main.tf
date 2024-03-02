
resource "aws_vpc_peering_connection" "tomcat_vpc_peering" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.vpc_id
  auto_accept   = var.auto_accept


    tags = {
    Name = var.peering_tag
  }

  accepter {
    allow_remote_vpc_dns_resolution = var.accepter_allow_remote_vpc_dns_resolution
  }

  requester {
    allow_remote_vpc_dns_resolution = var.requester_allow_remote_vpc_dns_resolution
  }
}


# # Accepter's side of the connection.
# resource "aws_vpc_peering_connection_accepter" "peer" {
#   vpc_peering_connection_id = var.peering_connection_id
#   auto_accept               = var.auto_accept

#   tags = {
#     Side = "Accepter"
#   }
# }
