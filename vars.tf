variable "REGION" {
  default = "us-east-1"
}

variable "AMI" {
  default = "ami-0dc2d3e4c0f9ebd18"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "KEYNAME" {
  default = "testKEY"
}

//variable "AWS_ACCESS_KEY_ID" {
//  type = string
//}
//
//variable "AWS_SECRET_ACCESS_KEY" {
//  type = string
//}

variable "DB_NAME" {
  default = "weather"
}

//variable "DB_PASSWORD" {
//  type = string
//}

variable "DB_USER" {
  default = "epam"
}