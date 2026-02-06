resource "aws_eip" "nat_eip" {
  domain = "vpc"
  for_each = toset(local.target_azs)
  tags = {
    "Name" = "${each.value}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  for_each = toset(local.target_azs)
  allocation_id = aws_eip.nat_eip[each.value].id
  subnet_id = aws_subnet.public_subnet[each.value].id

  tags = {
    "Name" = "${each.value}-nat-gateway"
  }
}