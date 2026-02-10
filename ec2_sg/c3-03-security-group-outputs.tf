##for public Bastion security group
output "bastion_sg_name" {
  description = "Name of Bastion Security Group"
  value = aws_security_group.bastion_sg.name
}

output "bastion_sg_id" {
  description = "Id of bastion security group"
  value = aws_security_group.bastion_sg.id
}

output "bastion_sg_vpc_id" {
  description = "vpc id of bastion security group"
  value = aws_security_group.bastion_sg.vpc_id
}

#for public host

output "public_sg_name" {
  description = "name of public security group"
  value = aws_security_group.public_sg.name   
}

output "public_sg_id" {
  description = "Id of public Security group"
  value = aws_security_group.public_sg.id
}

output "public_sg-vpc_id" {
  description = "Vpc id for public subnet"
  value = aws_security_group.public_sg.vpc_id
}

##for private security group
output "private_sg_name" {
  description = "name of private security group"
  value = aws_security_group.private_sg.name
}

output "private_sg_id" {
  description = "id of private security group"
  value = aws_security_group.private_sg.id
}

output "private_sg_vpc_id" {
  description = "vpc id of private security group"  
  value = aws_security_group.private_sg.vpc_id
}