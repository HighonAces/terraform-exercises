variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PUBLIC_SUBNET_CIDR_BLOCK" {
  default = "10.0.0.0/24"
}

variable "PRIVATE_SUBNET_CIDR_BLOCK" {
  default = "10.0.1.0/24"
}

variable "availability_zone_names" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "ANYWHERE" {
  default = "0.0.0.0/0"
}

variable "UBUNTU_2004_AMI" {
  type = string
  default = "ami-08d4ac5b634553e16"
}