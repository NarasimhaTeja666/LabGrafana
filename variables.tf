variable "ami" {
  type = string
  default = "ami-0b5eea76982371e91" #us-east-1
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "security_group" {
  type = string
  default = "launch-wizard-2"
}

variable "availability_zone" {
  type = string
  default = "us-east-1"
}

variable "ip_address" {
  type = string
  default = "52.7.179.86"
}