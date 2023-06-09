resource "aws_instance" "app_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = var.user_data
  key_name               = var.key_pair_name

  tags = {
    Name = "${var.tag_name}"
  }
}

