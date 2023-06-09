# Variables
variable "ami" {
  description = "AMI"
  type        = string
}

variable "aws_region" {
  description = "AWS deployment region"
  type        = string
}

variable "instance_name" {
  description = "EC2 Web Server name"
  type        = string
}

variable "key_pair_name" {
  description = "ssh key name"
  type        = string
}



variable "instance_type" {
  description = "instance type"
  type        = string
}
