terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_key_pair" "lab" {
  key_name   = "lab_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2OUa5Dx1fgrgBJfnLwVqLyvAPVM/PQsT9nhjn05wJFXXo0t2lYCoGuDARcEt662qipPs4zvYP1L/ltVVEdinATiUIfX96ApMRjrzecCt3eK2W84vMoO0YX2SYXOwzBy8o9vJhEebT4+A0oJ14h48p05KgV2BLRhuAxUUjaxzY6wIYfuK1UEBFgE6iPNONtl+VhVtpEUQ+MfYihdLcgkoqghS67k+hdmhDlGUQUd++lz3p4D9p8HyvMS1zAGOzftuB9yomhtinhOWuZbg9xims4l0GZi2TOJAs0FoONpPT1WLT5XuiYJ0hD39zh1UJkXS9TpQjiXrW5UAXxqvyI8l5KSsvOmrjKPRWFZ0oqwWCsLWCtlx6CfcDm6u5HDRc3dbfOso4/AAXfTlbI2L0XlxpIyWFU0trxhmJ2r2LsKOD08dbDTB/bWHiDNjanroWMQ0pTVXDdasTqYHE9HYjAkaEHb8Coxf2Az4xsgSzZC9anDhVWJDRdSsmq9qCl4r6/AM= narasimha@Narasimhas-MacBook-Air.local"
}

resource "aws_eip" "lab_eip" {
  instance = aws_instance.Grafana_ec2id
}

resource "aws_instance" "Grafana_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [var.security_group]
  #availability_zone = var.availability_zone
  #associate_public_ip_address = true
  key_name = aws_key_pair.lab.key_name
  #user_data = "${file("user_data.sh")}"
  tags = {
    "name" = "Grafana Server"
  }
}  

output "IP" {
    description = "IP address of Elastic IP"
    value = aws_eip.lab_eip.public_ip
}

