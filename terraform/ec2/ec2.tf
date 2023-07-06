################### Creating Ec2 Instances SG Groups #########################

locals {
  instance-userdata-ec2 = <<EOF
#!/bin/bash
sudo hostnamectl set-hostname ${var.ec2_host_name}
EOF
}

# security group
resource "aws_security_group" "ec2_sg" {
    name    = "${var.ec2_host_name}-sg"
    description = var.ec2_sg_description
    vpc_id = var.vpc_id
    // ingress rules
    
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]      
    }

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }  

    ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }


    ingress {
      from_port = 8
      to_port = 0
      protocol = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    lifecycle {
        create_before_destroy = false
    }
}


##################################### Creating EC2 ##########################


resource "aws_instance" "ec2_instance" {
    count =  var.ec2_instance_count
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    subnet_id = (var.public_subnet_ids)[1]
    # subnet_id = (var.private_subnet_ids)[1]
    associate_public_ip_address = var.ec2_ispublic
    availability_zone = var.ec2_availability_zone[1]
    disable_api_termination = var.ec2_disable_api_termination
    key_name = var.ssh_key_name
    user_data_base64 = base64encode(local.instance-userdata-ec2)  
    vpc_security_group_ids = [
        aws_security_group.ec2_sg.id
    ] 
################## Root volume For Ec2 ####################
    root_block_device {
      volume_type = "gp3"
      volume_size = "30"
    }

    # ebs_block_device {
    #   device_name = "/dev/sdf"
    #   volume_type = "gp3"
    #   volume_size = "20"
    # }

    # ebs_block_device {
    #   device_name = "/dev/sdg"
    #   volume_type = "gp3"
    #   volume_size = "20"
    # }

    # ebs_block_device {
    #   device_name = "/dev/sdh"
    #   volume_type = "gp3"
    #   volume_size = "50"
    # }
################################# Tags For EC2 Instances ########################


    tags = {
        Name = "${var.ec2_host_name}"   
        Creation_date = var.ec2_creation_date
    }
    depends_on = [ aws_security_group.ec2_sg]
}
