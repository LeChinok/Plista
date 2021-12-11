output "web_public_ip" {
    description = "EC2 Webserver public IP"
    value       = aws_instance.webserver.public_ip
}
