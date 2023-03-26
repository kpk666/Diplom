output "aws_instance_Dockerstation_ip" {
    value = aws_instance.Dockerstation.private_ip
}

output "aws_instance_Dockerstation_public_ip" {
    value = aws_instance.Dockerstation.public_ip
}