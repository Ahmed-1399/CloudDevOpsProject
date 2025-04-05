output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "The Public IP of the created EC2 instance"
}

output "instance_id" {
  value = aws_instance.this.id
  description = "ID of the EC2 Instance"
}

