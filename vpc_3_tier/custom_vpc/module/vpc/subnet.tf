#multiple vpc subnet
#for public subnet
resource "aws_subnet" "public_subnet" {
    for_each = zipmap(var.azs , var.public_subnet)
    vpc_id = aws_vpc.my_vpc.id
    availability_zone = each.key
    cidr_block = each.value
    map_public_ip_on_launch = true 

    tags = {
       "Name" = "public-subnet-${each.key}"
    } 
  
}

#for private subnet
resource "aws_subnet" "private_subnet" {
    for_each = zipmap(var.azs , var.private_subnet)
    vpc_id = aws_vpc.my_vpc.id
    availability_zone = each.key 
    cidr_block = each.value
    map_public_ip_on_launch = false

    tags = {
       "Name" = "private-subnet-${each.key}"
    }
}

#subnet for database
resource "aws_subnet" "db_subnet" {
    for_each = zipmap(var.azs , var.database_subnet)
    vpc_id = aws_vpc.my_vpc.id
    availability_zone = each.key
    cidr_block = each.value
    map_public_ip_on_launch = false

    tags = {
      "Name" =  "${each.key}-database-subnet"
    }
  
}

resource "aws_db_subnet_group" "db_group" {
    name = "database-subnet-group"
    subnet_ids = [for s in aws_subnet.db_subnet: s.id]
}