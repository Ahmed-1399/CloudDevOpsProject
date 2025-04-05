variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_a_cidr" {
  type        = string
  description = "CIDR block for subnet A"
}

variable "subnet_a_az" {
  type        = string
  description = "Availability Zone for subnet A"
}

# variable "subnet_b_cidr" {
#   type        = string
#   description = "CIDR block for subnet B"
# }

# variable "subnet_b_az" {
#   type        = string
#   description = "Availability Zone for subnet B"
# }