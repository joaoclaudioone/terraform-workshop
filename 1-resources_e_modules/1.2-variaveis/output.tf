/*
Outputs
*/
output "private_dns" {
    description = "Endereço privado da instância"
    value       = aws_instance.ec2_instance.private_dns
}

output "private_ip" {
    description = "Ip privado da instância"
    value       = aws_instance.ec2_instance.private_ip  
}

output "public_ip" { 
    description = "ip publico da instancia"
    value       = aws_instance.ec2_instance.public_ip
}

output "ec2" {
  description = "Mapa com todos os valores disponíveis para o EC2"
  value = aws_instance.ec2_instance
}