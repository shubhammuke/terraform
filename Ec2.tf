provider "aws" {
    region = "ap-south-2"
}

# Create a new EC2 instance
resource "aws_instance" "test-server" {
    ami = "ami-0ce4e694de0a4848c"
    key_name = "hydtest"
    instance_type = "t3.micro"
    associate_public_ip_address = true
    availability_zone = "ap-south-2a"
    
}

# Create a security group to allow SSH access
resource "aws_security_group" "test-sg" {
  name_prefix = "test-sg-"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}