output "subnet_id" {
  value = module.ec2.subnet_id
}

output "ami" {
  value = module.ec2.ami
}


output "public_dns" {
  value = module.ec2.public_dns
  description = "Endereço privado da instância"
}

output "public_ip" {
  value = module.ec2.public_ip
  description = "Ip privado da instância"
}