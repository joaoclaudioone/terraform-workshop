output "private_dns" {
  value = aws_instance.ec2_instance.*.private_dns
  description = "Endereço privado da instância"
}

output "private_ip" {
  value = aws_instance.ec2_instance.*.private_ip
  description = "Ip privado da instância"
}