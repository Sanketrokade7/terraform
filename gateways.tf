#igw for public subnet and nat gateways for private subnets
resource "aws_internet_gateway" "igw_cafe" {
  vpc_id = aws_vpc.cafe_vpc.id
  tags = {
    name = "igw-cafe"
  }
}
resource "aws_nat_gateway" "nat-gw_public1" {
  subnet_id = aws_subnet.sub_public1.id                    #---location
  allocation_id = aws_eip.eip_nat-gw_public1.id
  tags = {
    name = "nat-p1"
  }          
}
resource "aws_nat_gateway" "nat-gw_public2" {
  subnet_id = aws_subnet.sub_public2.id                  #---location
  allocation_id = aws_eip.eip_nat-gw_public2.id
  tags ={
    name = "nat-p2"
  }      
}
resource "aws_eip" "eip_nat-gw_public1" {
}
resource "aws_eip" "eip_nat-gw_public2" {
  
}