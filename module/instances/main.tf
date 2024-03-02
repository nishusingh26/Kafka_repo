// In module "instances"
variable "pub_sg_id" {}
variable "pvt_sg_id" {}

resource "aws_instance" "bastion" {
  count = length(var.public_subnet_ids) > 0 ? length(var.public_subnet_ids) - 1 : 0

  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id     = var.public_subnet_ids[count.index]
  key_name      = var.key-name

  vpc_security_group_ids = [var.pub_sg_id]

  tags = {
    Name = "${var.bastion-instance-name}-0${count.index + 1}"
  }
}

resource "aws_instance" "private_instance" {
  count = length(var.private_subnet_ids)

  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id     = var.private_subnet_ids[count.index]
  key_name      = var.key-name

  vpc_security_group_ids = [var.pvt_sg_id]

  tags = {
    Name = "${var.private-instance-name[count.index]}-${count.index + 1}"
  }
}
