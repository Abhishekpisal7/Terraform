terraform {
    required_version = "~> 1.14.4"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.31"
        }
    }

    # backend "s3" {
    #     bucket = "value"
    #     key = "value"
    #     path = "value"
    # }

}

provider "aws" {
    region = "ap-south-1"
}

data "aws_availability_zones" "zone" {
    state = "available"  
}

data "aws_ami" "name" {
    most_recent = true
    owners = [ "099720109477" ]

    filter {
      name = "name"
      values = [ "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*" ]
    }

    filter {
      name = "root-device-type"
      values = [ "ebs" ]
    }

    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }

    filter {
      name = "architecture"
      values = [ "x86_64" ]
    }

}
output "ami-id" {
  value = [ data.aws_ami.name.id ]
}
output "zone" {
  value =[
     for i, name in data.aws_availability_zones.zone.names:{
        name = name
        zone-id = data.aws_availability_zones.zone.zone_ids[i]
  }]
}

resource "aws_instance" "demo" {
    ami = data.aws_ami.name.id
    key_name = "demo"
    instance_type = "t2.micro"
    availability_zone = data.aws_availability_zones.zone.names[1]

    tags = {
      "env" = "dev"
    }
  }

  output "instance-id" {
      value = aws_instance.demo.id
  }

resource "aws" "name" {
  
}

resource "aws_security_group" "new_sg" {
  name = "demo security group"
  description = "Thisnis the demo security group"
  vpc_id = ""

  ingress {
    description = "Allow ssh Traffic"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    description = "Allow http traffic"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    description = "allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}