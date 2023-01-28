output "IP" {
    description = "IP address of Elastic IP"
    value = aws_eip.lab_eip.public_ip
}