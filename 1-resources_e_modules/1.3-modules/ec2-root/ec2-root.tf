provider "aws" {
    region = var.region
    version = "~> 2.0"
}

module "ec2" {
    source = "../ec2-module"

    qtd_instances = var.qtd_instances
    region = var.region
    instance_type = var.instance_type
    subnets = var.subnets
}
