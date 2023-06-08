resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"  # Replace with your desired AMI ID
  instance_type = "t3.small"                # Replace with your desired instance type

  tags = {
    Name = var.name
  }
}

 provisioner "remote-exec" {
   connection
   {
    type        = ssh
    host        = self.public_ip
    user        = "centos"
    password    = "DevOps321"
  }

  inline = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/chaliashok/roboshop-ansible.git main.yml -e env=dev -e role_name=${var.name}"
   ]
  }


resource "aws_route53_record" "example" {
  zone_id = "Z0783442RLRP3KGA9XLU"
  name    = "${var.name}-dev"  # Replace with your desired subdomain
  type    = "A"
  ttl     = "300"
  records = [aws_instance.web.private_ip]  # Replace with the IP address or target value
  allow_overwrite = true
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = "Example security group created with Terraform"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.name
  }
}

variable "name" {}