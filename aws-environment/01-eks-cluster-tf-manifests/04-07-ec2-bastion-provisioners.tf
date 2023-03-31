# Null Resource and Provisioners
resource "null_resource" "copy_ec2_keys" {
  depends_on = [module.ec2_bastion]
  # Connection Block: Provisioners connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/tf-eks-keypair.pem")
  }

  ## File Provisioner: Copy the .pem file to /tmp/.pem location
  provisioner "file" {
    source      = "private-key/tf-eks-keypair.pem"
    destination = "/tmp/tf-eks-keypair.pem"
  }

  ## Remote Exec Provisioner: Remote-exec provisioner to fix the private key permission on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/tf-eks-keypair.pem"
    ]
  }
}