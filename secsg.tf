
resource "aws_security_group" "sg-cafe" {
  name = "cafe-secgrp"
  vpc_id = aws_vpc.cafe_vpc.id
}
resource "aws_vpc_security_group_ingress_rule" "sg-ingress" {
  security_group_id = aws_security_group.sg-cafe.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 0
  to_port = 0
  ip_protocol = "all"
}
resource "aws_vpc_security_group_egress_rule" "sg-egress" {
  security_group_id = aws_security_group.sg-cafe.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 0
  to_port = 0
  ip_protocol = "all"
}