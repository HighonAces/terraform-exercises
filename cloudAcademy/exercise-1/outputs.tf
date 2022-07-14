output "vpc_id" {
  value = aws_vpc.exercise1-vpc.id
}

output "exercise1-public-subnet" {
  value = aws_subnet.exercise1-public-subnet.id
}

output "exercise1-private-subnet" {
  value = aws_subnet.exercise1-private-subnet.id
}

output "web_instance_public_ip" {
  value = aws_instance.ubuntu_web.public_ip
}