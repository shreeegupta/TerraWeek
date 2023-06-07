terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "terraweek" {
  count = 3
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = "TerraformKey"

  tags = {
    Name = "terraweek-day3-instance"
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Configuring the EC2 instance'"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy the instance'"
  }
}

output "ec2_public_ips" {
     value = aws_instance.terraweek[*].public_ip
}
