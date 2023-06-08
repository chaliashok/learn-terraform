resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id  # Replace with your desired AMI ID
  instance_type = "t3.small"                # Replace with your desired instance type
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.name
  }

  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/chaliashok/roboshop-ansible main.yml  -e role_name=${var.name}"
    ]
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z0783442RLRP3KGA9XLU"
  name    = "${var.name}-dev"  # Replace with your desired subdomain
  type    = "A"
  ttl     = 30
  records = [aws_instance.web.private_ip]  # Replace with the IP address or target value
  allow_overwrite = true
}

data "aws_ami" "example" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
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