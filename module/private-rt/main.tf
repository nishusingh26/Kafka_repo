resource "aws_route_table" "private-rt" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.private-rt-name
  }
}
resource "aws_route" "private-route" {
  route_table_id    = aws_route_table.private-rt.id
  destination_cidr_block = var.destination-cidr
  nat_gateway_id    = var.nat-id
}

resource "aws_route" "vpc_peering_private_route" {
  route_table_id                = aws_route_table.private-rt.id
  destination_cidr_block        = var.existing_vpc_cidr_block
  vpc_peering_connection_id     = var.vpc_peering_connection_id
}


resource "aws_route_table_association" "private-subnet-association" {
  count           = length(var.private_subnet_ids)
  subnet_id       = var.private_subnet_ids[count.index]
  route_table_id  = aws_route_table.private-rt.id
}