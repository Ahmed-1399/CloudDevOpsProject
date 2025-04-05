######################[VPC]######################
module "VPC" {
  source        = "./modules/VPC"
  vpc_cidr      = var.cidrs[0]
  subnet_a_cidr = var.cidrs[1]
  subnet_a_az   = var.AZs[0]
  # subnet_b_cidr = var.cidrs[2]
  # subnet_b_az   = var.AZs[1]
}

######################[2-EC2 Instances]######################
# -----> Master
module "EC2_1a" {
  source        = "./modules/EC2"
  ami_id        = var.ami
  instance_type = var.instance_type
  keyname       = aws_key_pair.mykey_1a.key_name
  # Varriable_in_modules     Output_in_Module[subnet_b_id]
  subnet_id         = module.VPC.subnet_a_id
  security_group_id = module.SG_1a.sg_id
  instance_name     = var.instance_name[0]
}
# -----> Slave
module "EC2_1b" {
  source        = "./modules/EC2"
  ami_id        = var.ami
  instance_type = var.instance_type
  keyname       = aws_key_pair.mykey_1a.key_name
  # keyname       = aws_key_pair.mykey_1b.key_name
  subnet_id = module.VPC.subnet_a_id
  # subnet_id         = module.VPC.subnet_b_id
  security_group_id = module.SG_1a.sg_id
  # security_group_id = module.SG_1b.sg_id
  instance_name = var.instance_name[1]
}

######################[Security Group]######################
# -----> Master
module "SG_1a" {
  source  = "./modules/SecurityGroup"
  vpc_id  = module.VPC.vpc_id
  sg_name = var.sg_name[0]
}
# -----> Slave
# module "SG_1b" {
#   source  = "./modules/SecurityGroup"
#   vpc_id  = module.VPC.vpc_id
#   sg_name = var.sg_name[1]
# }

######################[CloudWatch]######################
# -----> Master
module "cw_ec2_1a" {
  source = "./modules/CloudWatch"
  # Var_in_module         Output_in_Module[Instance_id_1a]
  instance_id   = module.EC2_1a.instance_id
  alarm_name    = var.alarm_name[0]
  alarm_actions = [aws_sns_topic.ivolve_topic.arn]
}

# -----> Slave
module "cw_ec2_1b" {
  source        = "./modules/CloudWatch"
  instance_id   = module.EC2_1b.instance_id
  alarm_name    = var.alarm_name[1]
  alarm_actions = [aws_sns_topic.ivolve_topic.arn]
}