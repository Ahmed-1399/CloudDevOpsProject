resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name = var.keyname
  security_groups = [var.security_group_id]
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name
  }
}
