#route tables private and public associated 
resource "aws_route_table" "rt-private1" {                     #---rt-private1
  vpc_id = aws_vpc.cafe_vpc.id
  tags = {
    name = "rt-private1"
  }
  
}
#resource "aws_route_table_association" "rt-assoc-private1" {  #--nat gateway association to private rt (private1)
 # gateway_id = aws_nat_gateway.nat-gw_public1.id
  #route_table_id = aws_route_table.rt-private1.id
#}
resource "aws_route_table_association" "rt-assoc-private1a" { #--subnet association to private rt (private1)
  subnet_id = aws_subnet.sub_private1.id
  route_table_id = aws_route_table.rt-private1.id
}
resource "aws_route_table" "rt-private2" {                    #---rt-private2
  vpc_id = aws_vpc.cafe_vpc.id
  tags = {
    name = "rt-private2"
  }
}
#resource "aws_route_table_association" "rt-assoc-private2" {  #nat gateway association to private rt (private2)
 # gateway_id = aws_nat_gateway.nat-gw_public2.id
  #route_table_id = aws_route_table.rt-private2.id
#}
resource "aws_route_table_association" "rt-assoc-private2b" { #subnet association to private rt (private2)
  subnet_id = aws_subnet.sub_private2.id
  route_table_id = aws_route_table.rt-private2.id
}
resource "aws_route_table" "rt-public" {                      #---- public rt
  vpc_id = aws_vpc.cafe_vpc.id
  tags = {
    name = "rt-public"
  }
}
#resource "aws_route_table_association" "rt-assoc-public_subnet1" {    #igw association to public rt
 # gateway_id = aws_internet_gateway.igw_cafe.id
  #route_table_id = aws_route_table.rt-public.id
#}
resource "aws_route_table_association" "rt-assoc-public_subnet1a" {   #subnet association to public rt(public1)
  subnet_id = aws_subnet.sub_public1.id 
  route_table_id = aws_route_table.rt-public.id
}
resource "aws_route_table_association" "rt-assoc-public_subnet2" {    #subnet association to public rt(public2)
  subnet_id = aws_subnet.sub_public2.id
  route_table_id = aws_route_table.rt-public.id
}
resource "aws_route" "route_private1" {
  route_table_id = aws_route_table.rt-private1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat-gw_public1.id
}
resource "aws_route" "route_private2" {
  route_table_id = aws_route_table.rt-private2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat-gw_public2.id
}
resource "aws_route" "route_public" {
  route_table_id = aws_route_table.rt-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw_cafe.id
}

  
