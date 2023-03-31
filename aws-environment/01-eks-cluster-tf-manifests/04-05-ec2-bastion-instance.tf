# AWS EC2 Instance Module
# Bastion Host - EC2 Instance in VPC Public Subnet
module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name          = "${local.name}-bastion-host"
  instance_type = var.instance_type
  ami           = data.aws_ami.amzlinux2.id
  key_name      = var.instance_keypair
  # monitoring             = true
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  # EC2 Bastion Tags
  tags = local.common_tags
}