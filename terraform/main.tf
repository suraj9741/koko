####################### Module for VPC ############################
module "test-vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone = var.availability_zone
  existing_vpc = var.existing_vpc
}

#######################  Module For Instance creation #############################
module "ec2-server" {
  source = "./ec2"
  vpc_id = (var.existing_vpc == "true" ? var.existing_vpc_id : module.test-vpc.vpc_id)
  public_subnet_ids = (var.existing_vpc == "true" ? var.public_subnet_id : module.test-vpc.public_subnet_ids)
  # private_subnet_ids = (var.existing_vpc == "true" ? var.private_subnet_id : module.test-vpc.private_subnet_ids)
  ssh_key_name = var.ssh_key_name
  ec2_host_name=var.ec2_host_name
  ec2_creation_date = var.ec2_creation_date
  ec2_availability_zone = var.ec2_availability_zone
  ec2_ami = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  ec2_sg_description = var.ec2_sg_description
  ec2_ispublic = var.ec2_ispublic
  ec2_disable_api_termination = var.ec2_disable_api_termination 
  ec2_instance_count = var.ec2_instance_count

}
