resource "aws_security_group" "bastion_sg" {
    name = "Bastion Security Group"
    description = "Security for Bastion host in public subnet"
    vpc_id = module.vpc.vpc_id

    ingress {
        description = "Allow SSH traffic for Bastion host"
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = " Allow all Outbound Traffic"
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      "for" = "bastion_sg" 
    }
  
}

