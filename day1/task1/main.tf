# Specify the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 instance
resource "aws_instance" "example" {
  count = 2
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = "TerraformKey"
  subnet_id = "subnet-001113100cb3bda4b"

  tags = {
    Name = "terraweek-demo-instance"
  }
}
