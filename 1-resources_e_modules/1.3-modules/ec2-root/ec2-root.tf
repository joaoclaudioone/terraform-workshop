provider "aws" {
    region  = var.region
    default_tags {
      tags = var.tags
    }
}

module "ec2" {
    source = "../ec2-module"

    qtd_instances = var.qtd_instances
    project       = var.project
    instance_type = var.instance_type
    ingress_list  = var.ingress_list
}
