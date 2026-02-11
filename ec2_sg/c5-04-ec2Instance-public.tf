# Public Instance

resource "aws_instance" "public_server" {
    for_each = tomap(module.vpc.public_subnet_id)
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.keyname
    subnet_id = each.value
    vpc_security_group_ids = [ aws_security_group.public_sg.id ]
    depends_on = [ module.vpc ]

    tags = {
      "Name" = "Public web Server" 
    }
}