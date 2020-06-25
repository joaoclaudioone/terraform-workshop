/*
Variaveis
*/
variable "region"{
  type = string
  description = "Região em que os recursos serão criados"
}

variable "instance_type" {
    type = string
    description = "Tipo da instância que será criada"
}

variable "subnets" {
    type = list(string)
    description = "Subnet aonde o recurso será criado"
}

variable "qtd_instances" {
    type = number
    default = 1
    description = "Quantidade de instâncias que serão criadas"
}

variable "project_name" {
    type = string
    description = "Nome do projeto"
}

variable "security_group" {
    type = string
    description = "id do security group da instância"
}

variable "keypair" {
    type = string
    description = "nome do keypair para acesso a instância"
}

variable "ami_id"{ 
    type = string
}