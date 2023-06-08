terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "terraform-remotebackend-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "terraweek" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = "TerraformKey"

  tags = {
    Name = "terraweek-day4-instance"
  }
}

output "ec2_public_ips" {
     value = aws_instance.terraweek.public_ip
}
