resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.public-rt-name
  }
}
resource "aws_route" "public-route" {
  route_table_id    = aws_route_table.public-rt.id
  destination_cidr_block = var.destination-cidr
  gateway_id        = var.igw-id
}

resource "aws_route" "vpc_peering_pub_route" {
  route_table_id                = aws_route_table.public-rt.id
  destination_cidr_block        = var.existing_vpc_cidr_block
  vpc_peering_connection_id     = var.vpc_peering_connection_id
}

resource "aws_route_table_association" "public-subnet-association" {
  count           = length(var.public_subnet_ids)
  subnet_id       = var.public_subnet_ids[count.index]
  route_table_id  = aws_route_table.public-rt.id
}

# Route for VPC One in the route table of VPC Two
resource "aws_route" "vpc1_route_in_vpc2" {
  route_table_id            = var.existing_vpc_route_table_id  # ID of the route table in VPC Two
  destination_cidr_block    = var.new_vpc_cidr_block      # CIDR block of VPC One
  vpc_peering_connection_id = var.vpc_peering_connection_id  # ID of the VPC peering connection
}
