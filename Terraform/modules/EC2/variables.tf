variable "ami_id" {
  type = string
  description = "ami of an instances"
}
variable "instance_type" {
  type = string
}
variable "keyname" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "instance_name" {
  type = string
}