provider "aws" {
    region  = var.region
}

resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids      = [aws_security_group.permite_ssh.id]
  key_name                    = aws_key_pair.key_workshop.id

  tags = merge(var.tags, {
    Name        = var.project
  },)
}

resource "aws_key_pair" "key_workshop" {
    key_name   = var.project
    public_key = file(var.public_key)
}

resource "aws_security_group" "permite_ssh" {
  name        = "permite_ssh"
  vpc_id      = var.vpc

  ingress {
    description = "Acesso a porta 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = merge(var.tags, {
    Name        = var.project
  },)
}