resource "aws_instance" "jump_server" {
  ami = "ami-0e0bf53f6def86294"
  security_groups = [aws_security_group.sg-cafe.id]
  key_name = "ohio"
  availability_zone = "us-east-2a"
  instance_type = "t2.micro"   
  subnet_id = aws_subnet.sub_public1.id
  associate_public_ip_address = "true"
}
resource "aws_instance" "private-1" {
  ami = "ami-0e0bf53f6def86294"
  security_groups = [aws_security_group.sg-cafe.id]
  key_name = "ohio"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub_private1.id
}
output "instance_public_ip" {
  value = aws_instance.jump_server.public_ip
}
output "instance_private_ip" {
  value = aws_instance.private-1.private_ip
}
