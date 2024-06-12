output "ec2_instance_id" {
  value = aws_instance.instance.id
}

output "public_ip" {
    description = "The public IP address of the web server"
    value = aws_instance.instance.public_ip
}