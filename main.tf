# 1 vpc and 4 subnets 2 private and 2 public
provider "aws" {
  region = "us-east-2"
}
resource "aws_vpc" "cafe_vpc" {
  cidr_block = "192.30.0.0/16"
  tags = {
    name="cafe_vpc_infra"
  }
}
resource "aws_subnet" "sub_private1" {
  cidr_block = "192.30.0.0/24"
  vpc_id = aws_vpc.cafe_vpc.id
  availability_zone = "us-east-2a"
  tags = {
    name="private_subnet1"
  }
}
resource "aws_subnet" "sub_private2" {
  cidr_block = "192.30.1.0/24"
  vpc_id = aws_vpc.cafe_vpc.id
  availability_zone = "us-east-2b"
  tags = {
    name="private_subnet2"
  }
}
resource "aws_subnet" "sub_public1" {
    cidr_block = "192.30.2.0/24"
    vpc_id = aws_vpc.cafe_vpc.id
    availability_zone = "us-east-2a"
    tags = {
      name="public_subnet1"
    }
}
resource "aws_subnet" "sub_public2" {
    cidr_block = "192.30.3.0/24"
    vpc_id = aws_vpc.cafe_vpc.id
    availability_zone = "us-east-2b"
    tags = {
      name="public_subnet2"
    }
  
}