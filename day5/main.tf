

module "ec2" {
  source               = "./module/ec2"
  ami                  = var.ami
  instance_type        = var.instance_type
  tag_name             = var.instance_name
  key_pair_name        = var.key_pair_name
  user_data            = file("./userdata.tpl")
}


