# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "terraweekday6-vpc"
  }
}

# Create Internet Gateway and Attach it to VPC
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "terraweekday6_internet_gateway"
  }
}

# Create Public Subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.Public_Subnet_1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraweekday6-public-subnet-1"
  }
}

# Create Route Table and Add Public Route
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "terraweekday6-Public Route Table"
  }
}

# Associate Public Subnet to "Public Route Table"
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}


# Create Security Group for the Web Server
resource "aws_security_group" "webserver-security-group" {
  name        = "Web Server Security Group"
  description = "Allow ssh and http"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web Server Security Group"
  }
}

#Create a new EC2
resource "aws_instance" "ec2_public" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  security_groups             = ["${aws_security_group.webserver-security-group.id}"]
  user_data                   = file("./userdata.tpl")

  tags = {
    "Name" = "terraweek-day6-server"
  }

}

