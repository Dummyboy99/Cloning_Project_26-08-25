resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Rohank-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "Rohank-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Rohank-IGW"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Rohank-RT"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_instance" "jenkins_master" {
  ami           = "ami-0b016c703b95ecbe4"      
  instance_type = "t3.small"
  key_name = "rohank-key"
  subnet_id = aws_subnet.main.id
  associate_public_ip_address = true
  

  tags = {
    Name = "Rohank-Jenkins-Master"
  }
}

resource "aws_instance" "application_node" {
  ami           = "ami-0329ba0ced0243e2b"      
  instance_type = "t3.small"
  key_name = "rohank-key"
  subnet_id = aws_subnet.main.id
  associate_public_ip_address = true
  

  tags = {
    Name = "Rohank-Application-Node"
  }
}