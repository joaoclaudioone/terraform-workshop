variable "tags" {
  description = "tags para os recursos"
  default = {
    terraform      = "true"
    repositorio    = "git@github.com:joaoclaudioone/terraform-workshop.git"
  }
}

variable "project" {
    description = "nome do projeto"
    type        = string
    default     = "Workshop"
}

variable "instance_type" {
    description = "Tipo da instância que será criada"
    type        = string
    default     = "t3.micro"
}

variable "qtd_instances" {
    description = "Quantidade de instâncias que serão criadas"
    type = number
    default = 3
}

variable "region" {
    description = "Região em que os recursos serão criados"
    type        = string
    default     = "us-east-1"
}

variable "ingress_list" {
    description = "Lista com as regras de entrada para o security group"
    default = [
        {
            from_port = 22
            to_port   = 22
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 8080
            to_port   = 8080
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}