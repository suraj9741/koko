## Terraform script for create a server with VPC or Without VPC

### For Creation of VPC need to do following changes

- variable need to change as per your requirement inside `/terraform/variables.tf`

    -   **existing_vpc**: This variable is you need to set true/false if its true then it will use existing resources and if its false then it will create new resources. for us now we need to set as **false**
    
    -   **vpc_cidr** : Check CIDR and change accordingly
    
    -   **public_subnet_cidr** : Give the rage of subnets which you want to create in public network

    -   **private_subnet_cidr** :  Give the rage of subnets which you want to create in private network

    -   **availability_zone** : Give the availability zone where you want to create subnet 

- Need to change inside `/terraform/vpc/output.tf` this file. If we are creating VPC then we need to uncomment all data inside the file

### For use existing VPC need to do following changes
- variable need to change as per your requirement inside `/terraform/variables.tf`

    -   **existing_vpc**: This variable is you need to set true/false if its true then it will use existing resources and if its false then it will create new resources. For us now we need to set as **true**

    -   **existing_vpc_id**: Check existing VPC and provide VPC id here

    -   **public_subnet_id**: Check public subnet in your existing VPC and give subnet id's

    -   **private_subnet_id**: Check private subnet in your existing VPC and give subnet id's

    -   **availability_zone** : Give the availability zone same that should match with above you provided subnets  

- Need to change inside `/terraform/vpc/output.tf` this file. If we are using existing VPC then we need to comment all data inside the file

### For server creation need to do following changes

- variable need to change as per your requirement inside `/terraform/variables.tf`
  - **ssh_key_name**: Check available keys inside AWS account and provide name here
  - **ec2_host_name**: Provide hostname which you want to give to the server
  - **ec2_creation_date**: This is extra variable today's date we should provide
  - **ec2_availability_zone**: Give the availability zone same that should match with above you provided subnets 
  - **ec2_ami**: ami id should we provide, so it will create by using that id
  - **ec2_instance_type**: instance type need to provide here 
  - **ec2_sg_description**: its extra variable need to provide description for security group 
  - **ec2_ispublic**: do want to assine public ip for this server or not according you need provide boolean value (true/false) in our case we want server in public so we are provideing **true**
  - **ec2_disable_api_termination**: this is server termination permission this value is on boolean (true/false) 
  - **ec2_instance_count**: how many instance you want to create enter the number here 

## How to run the script 
- Configure AWS credentials 
```shell
aws configure
```
- Initialise terraform 
```shell
terraform init
```
- Check terraform script is working oe not
```shell
terraform plan
```
- Run the terraform script and apply all changes
```shell
terraform apply
```
- If you want to destroy all resources use below command
```shell
terraform destroy
```