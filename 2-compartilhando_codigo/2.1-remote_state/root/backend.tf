terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "m4u-terraform-workshop"
        key = "states/2.1-remotestate.tfstate"
    }
}