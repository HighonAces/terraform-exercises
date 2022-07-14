resource "aws_key_pair" "exercise-1-keypair" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIAlGlXqH+wtqBd3Eah9bTFNa1SYb/MATyVwdHuotStuwp+HuKsESlcT496Vu+v49QTKgdf/XLG59Z64zPqrSICk0rjQnr1TVl7qVQyl34hPOyCjiatErn0tO753tUWdZC2qTnBZHhxVL7lRfOjvwIxgN+1x67hukozMP1POqAiFOqVURHVZHDos2Z//AVeafmDj4KhYb+uX3heEMq075P3ilfsOT40TlRLkvxynQe/4yVuWAVgwnCRoPGgWjw3bp6Pe4yw1G/KrZ0XoCQofQOOSgnz04rllBu6iGpPaqRvoj9hTAoECh8n4XIaA9wkeWBH5kfgXweEi7qJ1gIz7ZZtWhPNMKkg43AmoiK5jUwvLN9sbWRGAOly6RUM+dzD7EDJJvVybcJ967bFjIV/KJwt9ZSHUWRWROtYlUu26G04flUJOo8TepQwefriOXcbI/jGGu3EPB2SlfKZcpBw6GYd1VC/0s98Kjw4GG0SRMctmpZ8Swd4nhtL1MVvNAGt28= srjnr@DESKTOP-JFS0B4D"
}

resource "aws_instance" "ubuntu_web" {
  ami = var.UBUNTU_2004_AMI
  instance_type = "t2.micro"
  subnet_id = aws_subnet.exercise1-public-subnet.id
  vpc_security_group_ids = [aws_security_group.exercise-1-sg.id]
  key_name = aws_key_pair.exercise-1-keypair.id
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