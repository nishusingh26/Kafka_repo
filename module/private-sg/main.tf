resource "aws_security_group" "pvt-sg-1" {
  name        = var.pvt-sg-name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.pvt-sg-ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.pvt_cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.pvt_cidr_blocks
  }
}