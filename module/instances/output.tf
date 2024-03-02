output "bastion_instance_public_ips" {
   value = aws_instance.bastion[*].public_ip
}

output "private_instance_private_ips" {
   value = aws_instance.private_instance[*].private_ip
}

output "public_instance_ids" {
  value = aws_instance.bastion[*].id
}
output "private_instance_ids" {
  value = aws_instance.private_instance[*].id
}
