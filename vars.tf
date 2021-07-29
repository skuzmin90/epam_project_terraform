variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0dc2d3e4c0f9ebd18"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "keyname" {
  default = "testKEY"
}

variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}