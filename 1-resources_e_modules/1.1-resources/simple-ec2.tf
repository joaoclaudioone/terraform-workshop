provider "aws" {
    region = "us-east-1"
}


resource "aws_instance" "simple_ec2" {
  ami           = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  subnet_id = "subnet-02a471d0f42ce1646"
}