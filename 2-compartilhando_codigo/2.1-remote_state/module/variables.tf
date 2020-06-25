/*
Variaveis
*/
variable "project_name" {
    type = string
    description = "Nome do projeto"
}

variable "ingress_tcp_ports" {
    type = list(number)
    description = "Lista de portas tcp que serão liberadas no security group"
}

variable "vpc_id" {
    type = string
    description = "id da vpc onde será criado o security group"
}

variable "key_pair" {
    type = string
    description = "keypair padrão para logar na instância"
}