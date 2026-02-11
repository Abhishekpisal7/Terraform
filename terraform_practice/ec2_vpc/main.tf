provider "aws" {

    region = "ap-south-1"

}

resource "aws_vpc" "my_vpc" {
    
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "my_vpc"
    }   
}

resource "aws_subnet" "public_subnet" {

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "public_subnet"
    }
  
}

resource "aws_subnet" "private_subnet" {

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "private_subnet"
    }
  
}

resource "aws_subnet" "public_subnet_1" {

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.22.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true

    tags = {
      Name = "public_subnet_1"
    }
  
}

resource "aws_subnet" "private_subnet_1" {

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.29.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = false

    tags = {
      Name = "private_subnet_1"
    }
  
}

resource "aws_internet_gateway" "main" {

    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "main internet gateway"
    }
  
}

resource "aws_eip" "nat_eip" {
    domain = "vpc"
    
    tags = {
        Name = "nat_eip"
    }
}

resource "aws_nat_gateway" "natgateway" {

    allocation_id = aws_eip.nat_eip.id
    subnet_id =  aws_subnet.public_subnet.id

}

resource "aws_route_table" "private_table" {
    
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgateway.id
    }

    tags = {
        Name = "private_table"
    }
}

resource "aws_route_table_association" "private_subnet_association" {

    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_table.id

}

resource "aws_route_table" "private_table_1" {

    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgateway.id
    }
    tags = {
        Name = "private_table_1"
    }
  
}

resource "aws_route_table_association" "private_subnet_association_1" {

    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_table_1.id
}
  


resource "aws_route_table" "mian" {
    
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }

    tags = {
        Name = "main_route_table"
    }

}

resource "aws_route_table_association" "public_subnet" {

    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.mian.id
    
}

resource "aws_route_table_association" "public_subnet_1" {

    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.mian.id
  
}
resource "aws_security_group" "my_sg" {
    
    vpc_id = aws_vpc.my_vpc.id
    name = "my_security_group"

    ingress  {

        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {

        to_port = 80
        from_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {

        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
     
    tags = {
        Name = "my_vpc_security_group"
    }
  
}

resource "aws_instance" "my_instance" {

    ami ="ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
    key_name = "newkey"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = file("${path.module}/install_app.sh")
  depends_on = [     
              aws_vpc.my_vpc,
              aws_nat_gateway.natgateway
            ]
            tags = {
                Name = "vpc_module_instance"
            }
}

output "Instance_public_ip" {

    value = "https://${aws_instance.my_instance.public_ip}"
  
}
