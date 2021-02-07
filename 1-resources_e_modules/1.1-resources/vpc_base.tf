provider "aws" {
  region  = "us-east-1"
  profile = "personal"
}


resource "aws_vpc" "vpc_base" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name        = "VPC Base",
    Terraform   = "True",
    Repositorio = "git@github.com:joaoclaudioone/terraform-workshop.git"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_base.id

  tags = {
    Name        = "InternetGW"
    Terraform   = "True"
    Repositorio = "git@github.com:joaoclaudioone/terraform-workshop.git"
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_base.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "RT_publica"
    Terraform   = "True"
    Repositorio = "git@github.com:joaoclaudioone/terraform-workshop.git"
  }
}

resource "aws_subnet" "subnet_base" {
  vpc_id     = aws_vpc.vpc_base.id # essa referência será explicada mais a frente 
  cidr_block = "10.0.1.0/24"

  tags = {
    Name        = "Subnet_base",
    Terraform   = "True",
    Repositorio = "git@github.com:joaoclaudioone/terraform-workshop.git"
  }
}

resource "aws_route_table_association" "rt_public_association" {
  subnet_id      = aws_subnet.subnet_base.id
  route_table_id = aws_route_table.rt_public.id
}