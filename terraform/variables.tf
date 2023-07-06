############################## For New VPC Configurations ################################
variable "vpc_cidr" {
  description = "enter Vpc cidr range "
  default = "172.17.64.0/24"
}
variable "public_subnet_cidr" {
  type = list
  default = ["172.17.64.0/27","172.17.64.32/27","172.17.64.64/26"]
}
variable "private_subnet_cidr" {
  type = list
  default = ["172.17.64.128/27","172.17.64.160/27","172.17.64.192/26"]
}
variable "availability_zone" {
  type = list
  default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
}


############################ For Existing VPC ####################
variable "existing_vpc" {
  default = "true"
  # default = "false"
}
variable "public_subnet_id" {
  type = list
  default = ["subnet-03c3d09fc4762912f","subnet-033f2276319b6ebfe","subnet-0aaf949af50cdbd93"]
}
variable "private_subnet_id" {
  type = list
  default = ["subnet-eee15c86","subnet-56d5381a"]
}
variable "existing_vpc_id" {
  default = "vpc-06e17328293dcd49c"
  
}
################################ ec2 server Details ##########################
variable "ssh_key_name" {
  default = "terraform_test"
}
variable "ec2_host_name" {
  default = "jenkins.suraj.com"
}
variable "ec2_creation_date" {
  default = "2023-07-05"
}
variable "ec2_availability_zone" {
  type = list
  default = ["ap-south-1a","ap-south-1b"]
}
variable "ec2_ami" {
  default = "ami-0f5ee92e2d63afc18"
}
variable "ec2_instance_type" {
  default = "t2.medium"
}
variable "ec2_sg_description" {
  default = "abc.com-sg(Managed by Terraform)"
}
variable "ec2_ispublic" {
  default = "true"
}
variable "ec2_disable_api_termination" {
  default = "true"
}
variable "ec2_instance_count" {
  type        = number
  default = 1
}
