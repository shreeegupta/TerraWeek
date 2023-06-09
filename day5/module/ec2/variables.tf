
variable "instance_type" {
  description = "the instance type for our instance"
}

variable "tag_name" {
  description = "name of tag for our instance"
}

variable "user_data" {
  description = "userdata that will install webserver bashscript"
}

variable "ami" {
  description = "the instance type for our instance"
}

variable "key_pair_name" {
  description = "key pair name"
}