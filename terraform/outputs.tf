

output "isntance-ip" {
    description = "La IP pública de EC2 para acceder via web o SSH"
    value = aws_instance.django-server.public_ip
  
}