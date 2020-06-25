output "security_group_id" {
  value = module.security_group.security_group_id
  description = "Endereço privado da instância"
}

output "keypair_name" {
  value = module.security_group.default_key_pair
  description = "id do keypair"
}