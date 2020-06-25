provider "aws" {
    region = var.region
    version = "2.66"
}


/*
Recupera a ultima versão da AMI Amazon Linux
*/
data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = ["amazon"]

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
 }
}

/*
Recupera as informações de security group e keypair
*/
data "terraform_remote_state" "security" {
    backend =  "s3"

    config = {
        bucket = var.remote_bucket
        key = var.sg_remote_state_s3_key
        region = var.region
    }
}