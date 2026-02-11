# for private instance

resource "aws_instance" "private_server" {
  for_each = tomap(module.vpc.private_subnet_id)
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.keyname
  subnet_id = each.value
  vpc_security_group_ids = [ aws_security_group.private_sg.id ]
  depends_on = [ module.vpc.my_vpc ]

  tags = {
    "Name" = "private server" 
  }
} 