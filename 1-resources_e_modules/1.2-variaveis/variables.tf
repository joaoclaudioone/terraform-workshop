/*
Variaveis
*/
variable "tags" {
  description = "tags para os recursos"
  default = {
    terraform      = "true"
    repositorio    = "git@github.com:joaoclaudioone/terraform-workshop.git"
  }
}

variable "project" {
    description = "Nome do projeto"
    type        = string
    default     = "Workshop"
}

variable "region" {
    description = "Região em que os recursos serão criados"
    type        = string
    default     = "us-east-1"
}

variable "profile" { 
    description = "Perfil do arquivo ~/.aws/credencials"
    type        = string
    default     = "personal"
}

variable "ami_id" {
    description = "Amazon Linux 2 da região us-east-1"
    type        = string
    default     = "ami-09d95fab7fff3776c"
}

variable "instance_type" {
    description = "Tipo da instância que será criada"
    type        = string
    default     = "t3.micro"
}

variable "subnet" {
    description = "Subnet onde o recurso será criado"
    type        = string
}

variable "public_ip" {
    description = "Assoscia um ip publico para a instância"
    type        = bool
    default     = true
}

variable "public_key" {
    description = "caminho da chave pública"
    type        = string
    default     = "~/.ssh/id_rsa.pub"
}

variable "vpc" {
    description = "id da vpc"
    type        = string
}