resource "aws_instance" "ec2_instance" {
  count                       = var.qtd_instances

  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  subnet_id                   = element(tolist(data.aws_subnet_ids.subnet_id.ids), count.index) # previne que caso o número de instancias seja menor que o de subnets volte um erro
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids      = [aws_security_group.sg_default.id]
  key_name                    = aws_key_pair.key_pair.id

  tags = {
    Name                      = "${var.project}-${count.index +1}"
  }
}

resource "aws_key_pair" "key_pair" {
    key_name   = "${var.project}-module"
    public_key = file(var.public_key)
}

resource "aws_security_group" "sg_default" {
  name        = "Default-SG-${var.project}"
  vpc_id      = data.aws_vpc.available.id
  
  dynamic "ingress" {
    for_each = [for i in var.ingress_list : 
      {
        from_port   = i.from_port
        to_port     = i.to_port
        protocol    = i.protocol
        cidr_blocks = i.cidr_blocks
      }]

      content {
        from_port   = ingress.value.from_port
        to_port     = ingress.value.to_port
        protocol    = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
      }
  }

  dynamic "egress" {
    for_each = [for i in var.egress_list : 
      {
        from_port   = i.from_port
        to_port     = i.to_port
        protocol    = i.protocol
        cidr_blocks = i.cidr_blocks
      }]

      content {
        from_port   = egress.value.from_port
        to_port     = egress.value.to_port
        protocol    = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
      }      
  }
  
  tags = {
    Name        = var.project
  }
}