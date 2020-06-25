resource "aws_security_group" "ec2_security_group" {
  name = var.project_name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_tcp_ports
    content {
      from_port = port.value
      to_port   = port.value
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "default_kp" {
    key_name = var.project_name
    public_key = file(var.key_pair)
}
