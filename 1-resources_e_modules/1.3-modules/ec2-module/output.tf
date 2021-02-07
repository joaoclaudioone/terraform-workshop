output "public_dns" {
  value = aws_instance.ec2_instance.*.public_dns
  description = "Endereço privado da instância"
}

output "public_ip" {
  value = aws_instance.ec2_instance.*.public_ip
  description = "Ip privado da instância"
}

output "subnet_id" {
  value = data.aws_subnet_ids.subnet_id.ids
}

output "ami" {
  value = data.aws_ami.latest_ami.id
}