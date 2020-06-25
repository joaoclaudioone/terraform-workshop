output "private_dns" {
  value = module.ec2.private_dns
  description = "Endereço privado da instância"
}

output "private_ip" {
  value = module.ec2.private_ip
  description = "Ip privado da instância"
}

output "keypair" {
  value = data.terraform_remote_state.security.outputs.keypair_name
  description = "chave utilizada"
}

output "security_group" {
  value = data.terraform_remote_state.security.outputs.security_group_id
  description = "security group utilizado"
}
