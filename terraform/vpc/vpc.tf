##################### create VPC #############################


resource "aws_vpc" "test-vpc" {
  count = var.existing_vpc == "true" ? 0 : 1
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support= "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "test-vpc"
  }
}

 ########### create Internet-getway #######################

resource "aws_internet_gateway" "Igw" {
  count = var.existing_vpc == "true" ? 0 : 1
  vpc_id = aws_vpc.test-vpc[0].id

  tags = {
    Name = "internet-getway"
  }
}

 ################ Create Public subnet ######################

resource "aws_subnet" "Public-Subnet" {
  count = var.existing_vpc == "true" ? 0 : length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.test-vpc[0].id
  cidr_block =  "${element(var.public_subnet_cidr,count.index)}"
  availability_zone = "${element(var.availability_zone,count.index)}" 
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-${element(var.availability_zone,count.index)}"
  }
}

################### Public Route Table #################################

resource "aws_route_table" "Public-route" {
  count = var.existing_vpc == "true" ? 0 : 1
  vpc_id = aws_vpc.test-vpc[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Igw[0].id 
  }
  tags = {
    Name = "Public_route_table"
  }
}
  
#################### Route Table Association Public #######################

resource "aws_route_table_association" "Public-route-association" {
  count = var.existing_vpc == "true" ? 0 : length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.Public-Subnet.*.id,count.index)
  route_table_id = aws_route_table.Public-route[0].id
}

###################### Create Private subnet ########################

resource "aws_subnet" "Private-Subnet" {
  count = var.existing_vpc == "true" ? 0 : length(var.private_subnet_cidr)
  vpc_id = aws_vpc.test-vpc[0].id
  cidr_block =  element(var.private_subnet_cidr,count.index)
  availability_zone = element(var.availability_zone,count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "Private-Subnet-${element(var.availability_zone,count.index)}"
  }
}


######################### Creating EIP For Nat ######################

resource "aws_eip" "my-test-eip" {
  count = var.existing_vpc == "true" ? 0 : 1
  domain = "vpc"
}

####################### Create Nat Gateway ##############################

resource "aws_nat_gateway" "natgetway" {
  count = var.existing_vpc == "true" ? 0 : 1
  depends_on  = [aws_internet_gateway.Igw]
  allocation_id = aws_eip.my-test-eip[0].id
  subnet_id     = aws_subnet.Public-Subnet[0].id

  tags = {
    Name = "gw NAT"
  }
}

######################## Create Route Table for Private_Route ###################

resource "aws_route_table" "Private-route" {
  count = var.existing_vpc == "true" ? 0 : 1
  vpc_id = aws_vpc.test-vpc[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgetway[0].id 
  }
  tags = {
    Name = "Private_route_table"
  }
}

############################# Associate Route Table For Private Routes #############

resource "aws_route_table_association" "Private-route-association" {
  count = var.existing_vpc == "true" ? 0 : length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.Private-Subnet.*.id,count.index)
  route_table_id = aws_route_table.Private-route[0].id

}
