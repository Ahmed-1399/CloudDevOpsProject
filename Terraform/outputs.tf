output "vpc_id" {
  value = module.VPC.vpc_id
}
######################[ Outputs of 2-Subnets id ]######################
output "subnet_a_id" {
  value = module.VPC.subnet_a_id
}

# output "subnet_b_id" {
#   value = module.VPC.subnet_b_id
# }

######################[ Outputs of 2-Instances ]######################
output "Master-public_ip_1a" {
  value = module.EC2_1a.public_ip
}
output "Slave-public_ip_1b" {
  value = module.EC2_1b.public_ip
}

output "Master-EC2_id_1a" {
  value = module.EC2_1a.instance_id
}
output "Slave-EC2_id_1b" {
  value = module.EC2_1b.instance_id
}

######################[ Output of 2-SGs ]######################
output "sg_id_1a" {
  value = module.SG_1a.sg_id
}
# output "sg_id_1b" {
#   value = module.SG_1b.sg_id
# }

