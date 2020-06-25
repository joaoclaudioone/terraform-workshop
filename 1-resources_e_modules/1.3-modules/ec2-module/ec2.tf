resource "aws_instance" "ec2_instance" {
  count         = var.qtd_instances
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnets, count.index) # previne que caso o número de instancias seja menor que o de subnets volte um erro

  tags = {
    Name = "WS-Terraform-${count.index +1}"
  }
}

