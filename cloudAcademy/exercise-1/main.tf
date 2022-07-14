resource "aws_instance" "ubuntu_web" {
  ami = var.UBUNTU_2004_AMI
  instance_type = "t2.micro"
  subnet_id = aws_subnet.exercise1-public-subnet.id
  vpc_security_group_ids = [aws_security_group.exercise-1-sg]
  user_data = <<EOF
#!/bin/bash
apt-get -y update
apt-get -y install nginx
service nginx start
echo fin v1.00!
EOF

  tags = {
    Name = "exercise-1-ec2"
  }

}