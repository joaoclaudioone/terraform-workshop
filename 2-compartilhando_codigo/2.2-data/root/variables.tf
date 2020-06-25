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

variable "sg_remote_state_s3_key" {
  type = string
  description = "local do estado remoto com os dados de sg e keypair"
}

variable "remote_bucket" {
  type = string
  description = "nome do bucket aonde o estado remoto está armazenado"
}