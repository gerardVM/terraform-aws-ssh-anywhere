data "aws_instance" "target_instance" {
  instance_id = var.instance_id
}

data "aws_subnet" "target_instance" {
  id = data.aws_instance.target_instance.subnet_id
}

resource "aws_security_group" "allow_outgoing_traffic" {
  name        = "ec2_instance_connect_endpoint_sg"
  description = "Allow TLS outbound traffic"
  vpc_id      = data.aws_subnet.target_instance.vpc_id

  dynamic "egress" {
    for_each = var.connection_ports
    content {
      from_port       = egress.value
      to_port         = egress.value
      protocol        = "tcp"
      security_groups = [ var.instance_security_group_id ]
    }
  }
}

resource "aws_security_group_rule" "allow_eice" {
  for_each = { for port in var.connection_ports : port => port }

  type                     = "ingress"
  from_port                = each.value
  to_port                  = each.value
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.allow_outgoing_traffic.id
  security_group_id        = var.instance_security_group_id
}

resource "aws_ec2_instance_connect_endpoint" "eice" {
  subnet_id          = data.aws_subnet.target_instance.id
  security_group_ids = [ aws_security_group.allow_outgoing_traffic.id ]
}