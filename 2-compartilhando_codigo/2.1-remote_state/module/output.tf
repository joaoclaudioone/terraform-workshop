output "security_group_id" {
  value = aws_security_group.ec2_security_group.id
  description = "Security group da instância"
}

output "default_key_pair" {
  value = aws_key_pair.default_kp.id 
  description = "id da keypair"
}