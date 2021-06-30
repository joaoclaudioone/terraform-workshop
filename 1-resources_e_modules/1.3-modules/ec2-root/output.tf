output "subnet_id" {
  description = "Subnets aonde os recursos foram criados"
  value = module.ec2.subnet_id
}

output "ami" {
  description = "Id da ami utilizada"
  value = module.ec2.ami
}

output "public_dns" {
  description = "Endereço privado da instância"
  value = module.ec2.public_dns
}

output "public_ip" {
  description = "Ip privado da instância"
  value = module.ec2.public_ip
}