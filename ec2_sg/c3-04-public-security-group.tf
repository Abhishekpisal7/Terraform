# security group for public instance

resource "aws_security_group" "public_sg" {
    name = "public_sg"
    description = "security group for public subnet instance"
    vpc_id = module.vpc.vpc_id
    
    ingress {
        description = "Allow http traffic"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow https traffic"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    egress {
        description = "allow all traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}