provider "aws" {
    region = var.region
    version = "~> 2.66.0"
}

module "security_group" {
    source = "../module"

    project_name      = var.project_name
    ingress_tcp_ports = var.ingress_tcp_ports
    vpc_id            = var.vpc_id
    key_pair          = var.key_pair
}
