module "ec2" {
    source = "../module"

    qtd_instances = var.qtd_instances
    region = var.region
    instance_type = var.instance_type
    subnets = var.subnets
    project_name = var.project_name
    ami_id = data.aws_ami.amazon-linux-2.id
    security_group = data.terraform_remote_state.security.outputs.security_group_id
    keypair = data.terraform_remote_state.security.outputs.keypair_name
}