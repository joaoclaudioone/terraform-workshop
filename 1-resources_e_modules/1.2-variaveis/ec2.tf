/*
Variaveis
*/
variable "region"{
  type = string
  description = "Região em que os recursos serão criados"
}

variable "ami_id" {
   type = string
   default = "ami-09d95fab7fff3776c"
   description = "Amazon Linux 2 da região us-east-1"
}

variable "instance_type" {
  type = string
  description = "Tipo da instância que será criada"
}

variable "subnet" {
  type = string
  description = "Subnet aonde o recurso será criado"
}

/*
Recursos
*/
provider "aws" {
    region = var.region
}


resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet
}

/*
Outputs
*/
output "private_dns" {
  value       = aws_instance.ec2_instance.private_dns
  description = "Endereço privado da instância"
}

output "private_ip" {
  value       = aws_instance.ec2_instance.private_ip
  description = "Ip privado da instância"
}