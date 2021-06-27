resource "aws_vpc" "webapp-vpc" {
  cidr_block = "172.45.0.0/16"
}

resource "aws_internet_gateway" "igw-webapp" {
  vpc_id = aws_vpc.webapp-vpc.id
}

resource "aws_default_route_table" "route-table-webapp" {
  default_route_table_id = aws_vpc.webapp-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-webapp.id
  }

  tags = {
    Name = "Salida a internet"
  }
}

resource "aws_subnet" "subnet-webapp-1a" {
  vpc_id     = aws_vpc.webapp-vpc.id
  cidr_block = "172.45.15.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "VPC US-East-1a"
  }
}

resource "aws_subnet" "subnet-webapp-1b" {
  vpc_id     = aws_vpc.webapp-vpc.id
  cidr_block = "172.45.20.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "VPC US-east-1b"
  }
}

resource "aws_subnet" "subnet-webapp-1c" {
  vpc_id     = aws_vpc.webapp-vpc.id
  cidr_block = "172.45.25.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "VPC US-East-1c"
  }
}

resource "aws_subnet" "subnet-webapp-1d" {
  vpc_id     = aws_vpc.webapp-vpc.id
  cidr_block = "172.45.30.0/24"
  availability_zone = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name = "VPC US-East-1d"
  }
}
