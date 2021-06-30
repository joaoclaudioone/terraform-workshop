variable "project" {
    description = "Nome do projeto"
    type        = string
}

variable "instance_type" {
    description = "Tipo da instância que será criada"
    type        = string
    default     = "t3.micro"
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

variable "qtd_instances" {
    description = "Quantidade de instâncias que serão criadas"
    type = number
    default = 1
}

variable "ingress_list" {
    description = "Lista com as regras de entrada para o security group"
    type = list
}

variable "egress_list" {
    description = "Lista com as regras de entrada para o security group"
    type        = list
    default     = [
        {
            from_port = 0
            to_port   = 0
            protocol  = -1
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}

variable "query_ami" {
    description = "Valores que serão usados para a retornar a ultima ami"
    type        = map
    default     = {
        owners  = ["amazon", "801119661308"]
        name    = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
    }
}