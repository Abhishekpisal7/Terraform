resource "aws_route_table" "public_subnet_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  
  tags = {
    "Name" = "public-table"
  }
}

resource "aws_route_table" "private_subnet_table" {
  vpc_id = aws_vpc.my_vpc.id
  for_each = tomap(local.local_values)
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[each.value].id
  }
  tags = {
    "Name" = "${each.key}-private-table"
  }
}

resource "aws_route_table" "db_subnet_table" {
  vpc_id = aws_vpc.my_vpc.id
  for_each = tomap(local.local_values)
  route {
    cidr_block = "0.0.0.0/24"
    nat_gateway_id = aws_nat_gateway.nat_gateway[each.value].id
  }

  tags = {
    "Name" = "${each.key}-db-subnet-group" 
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  for_each = toset(var.azs)
  subnet_id = aws_subnet.public_subnet[each.value].id
  route_table_id = aws_route_table.public_subnet_table.id
}

resource "aws_route_table_association" "private_subnet_association" {
  for_each = toset(var.azs)
  subnet_id = aws_subnet.private_subnet[each.value].id
  # route_table_id = var.enable_single_nat_gateway? aws_route_table.private_subnet_table[var.azs[0]].id : aws_route_table.private_subnet_table[each.value].id 
  route_table_id = aws_route_table.private_subnet_table[each.value].id
}

resource "aws_route_table_association" "db_subnet_association" {
  for_each = toset(var.azs)
  subnet_id = aws_subnet.db_subnet[each.key].id
  route_table_id = aws_route_table.db_subnet_table[each.key].id
}