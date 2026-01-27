provider "aws" {
    
    region = "ap-south-1"
  
}

# This data block is for the first availability zone
data "aws_availability_zones" "name" {

    state = "available"
}

output "available-zone" {

    value = data.aws_availability_zones.name.names
  
}

# This data block is for the default security group in the first availability zone
data "aws_security_group" "name" {

    name = "default"
}

output "security_group_id" {

    value = data.aws_security_group.name.id
  
}

# This data block is for the default VPC
data "aws_vpc" "name" {

    tags = {
      type = "default_vpc"
    }
}

output "vpc_id" {

    value = data.aws_vpc.name.id

}

# This data block is for the latest Amazon Linux AMI
data "aws_ami" "amazon_linux" {

    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

output "ami_id" {
    description = "latest Amazon Linux AMI"
    value = data.aws_ami.amazon_linux.id  
}


resource "aws_instance" "Test_instance" {
    
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
    key_name = "newkey"
    vpc_security_group_ids = [data.aws_security_group.name.id]

    tags = {
      Name = "Test_insttance"
    }
  
}
