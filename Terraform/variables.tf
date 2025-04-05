variable "region" {
  default = "us-east-1"
}

######################[VPC]######################
variable "cidrs" {
  type    = list(string)
  default = ["10.0.0.0/16", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "AZs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

######################[EC2]######################
variable "ami" {
  type    = string
  default = "ami-00a929b66ed6e0de6"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "private_key" {
  type    = list(string)
  default = ["mykey_1a", "mykey_1b"]
}
variable "instance_name" {
  type    = list(string)
  default = ["Master-EC2", "Slave-EC2"]
}

######################[Security Group]######################
variable "sg_name" {
  type        = list(string)
  default     = ["Master-SG", "Slave-SG"]
  description = "Allow SSH, HTTP"
}

######################[CloudWatch]######################
variable "alarm_name" {
  type    = list(string)
  default = ["Master-ec2_cpu_alarm", "Slave-ec2_cpu_alarm"]
}