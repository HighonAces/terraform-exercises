resource "aws_internet_gateway" "exercise-1-igw" {
  vpc_id = aws_vpc.exercise1-vpc.id
  tags = {
    Name = "exercise-1-igw"
  }
}

resource "aws_route_table" "exercise-1-crt" {
  vpc_id = aws_vpc.exercise1-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = var.ANYWHERE

    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.exercise-1-igw.id
  }

  tags = {
    Name = "exercise-1-crt"
  }
}

resource "aws_route_table_association" "exercise-1-rta" {
  subnet_id = aws_subnet.exercise1-public-subnet.id
  route_table_id = aws_route_table.exercise-1-crt.id
}

resource "aws_security_group" "exercise-1-sg" {
  vpc_id = aws_vpc.exercise1-vpc.id

  egress {
    from_port = 0
    protocol  = -1
    to_port   = 0
    cidr_blocks = [var.ANYWHERE]
  }

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = [var.ANYWHERE]
  }

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = [var.ANYWHERE]
  }

  tags = {
    Name = "exercise-1-resources"
  }
}