data "aws_vpc" "available" {
  state = "available"
  
  filter {
      name   = "tag:Name"
      values  = ["VPC Base"]
    }
}

data "aws_subnet_ids" "subnet_id" {
  vpc_id = data.aws_vpc.available.id
}

data "aws_ami" "latest_ami" {
  most_recent = true
  owners = var.query_ami.owners

  filter {
    name   = "name"
    values = var.query_ami.name
  }
}