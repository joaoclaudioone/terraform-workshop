output "private_dns" {
  value = module.ec2.private_dns
  description = "Endereço privado da instância"
}

output "private_ip" {
  value = module.ec2.private_ip
  description = "Ip privado da instância"
}