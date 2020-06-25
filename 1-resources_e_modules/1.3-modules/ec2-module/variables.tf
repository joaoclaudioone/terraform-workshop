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

variable "subnets" {
    type = list(string)
    description = "Subnet aonde o recurso será criado"
}

variable "qtd_instances" {
    type = number
    default = 1
    description = "Quantidade de instâncias que serão criadas"
}