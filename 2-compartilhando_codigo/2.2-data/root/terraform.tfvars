region = "us-east-1"
instance_type = "t3.nano"
subnets = ["subnet-02a471d0f42ce1646", "subnet-04b7e71aa19b8d444"]
qtd_instances = 1
project_name = "Terraform-Workshop"

remote_bucket = "m4u-terraform-workshop"
sg_remote_state_s3_key = "states/2.1-remotestate.tfstate"