resource "aws_security_group" "private_sg" {
    name = "private_sg"
    description = "Security Group for Private Subnet"
    vpc_id = module.vpc.vpc_id

    ingress {
        description = "Allow Necessary Traffic"
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = [module.vpc.vpc_cidr_block]
    }

    ingress {
        description = "Allow Http Traffic To Private Subnet"
        to_port = 80
        from_port = 80
        protocol = "tcp"
        cidr_blocks = [module.vpc.vpc_cidr_block]
    }

    egress {
        description = "Allow All Outbound Traffic"
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = [module.vpc.vpc_cidr_block]
    }
  
}