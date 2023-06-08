resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"  # Replace with your desired AMI ID
  instance_type = "t3.small"                # Replace with your desired instance type

  tags = {
    Name = var.name
  }
}

variable "name" {}