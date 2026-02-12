#Bastion host ec2 instance
resource "aws_instance" "Bastion_host" {
    # for_each = tomap(module.vpc.public_subnet_id)
    #for_each = local.Bastion_host_subnet
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.keyname
    vpc_security_group_ids = [ aws_security_group.bastion_sg.id ]
    
    subnet_id = module.vpc.bastion_subnet[0]

    
    depends_on = [ module.vpc.my_vpc ]
    tags = {
      "Name" = "Bastion_host"
    }
}