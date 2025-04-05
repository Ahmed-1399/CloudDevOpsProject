
resource "tls_private_key" "mykey_1a" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "mykey_1a" {
  key_name   = var.private_key[0]
  public_key = tls_private_key.mykey_1a.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.mykey_1a.private_key_pem}' > mykey_1a.pem"
    # to Download "private_key" to my pc-Windows
    interpreter = ["PowerShell", "-Command"]
  }
}
# resource "tls_private_key" "mykey_1b" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }
# resource "aws_key_pair" "mykey_1b" {
#   key_name   = var.private_key[1]
#   public_key = tls_private_key.mykey_1b.public_key_openssh

#   provisioner "local-exec" {
#     command = "echo '${tls_private_key.mykey_1b.private_key_pem}' > mykey_1b.pem"
#     # to Download "private_key" to my pc-Windows
#     interpreter = ["PowerShell", "-Command"]
#   }
# }