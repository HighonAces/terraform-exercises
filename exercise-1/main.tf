provider "aws" { region = var.region }

terraform {required_version = ">=1.04, < 1.05" }

data "aws_ssm_parameter" "ubuntu-focal" {
  name = "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

resource "aws_instance" "web" {
  ami = data.aws_ssm_parameter.ubuntu-focal.value
  instance_type = var.instance_type
  subnet_id = aws_subnet.public-1.id
  vpc_security_group_ids = aws_security_group.web-sg.id
  user_data = file("bootstrap.sh")
  tags = {
    Name = "Basic-Web-Server"
    Stage = "Test"
  }
}

output "web" {
  value = [aws_instance.web.public_ip]
}