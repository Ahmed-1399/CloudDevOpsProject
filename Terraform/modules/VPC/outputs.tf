output "vpc_id" {
  value = aws_vpc.ivolve.id
  description = "ID of VPC"
}

######################[Outputs of 2-Subnets id ]######################
output "subnet_a_id" {
  value       = aws_subnet.subnet_1a.id
  description = "ID of subnet A"
}

# output "subnet_b_id" {
#   value       = aws_subnet.subnet_1b.id
#   description = "ID of subnet B"
# }