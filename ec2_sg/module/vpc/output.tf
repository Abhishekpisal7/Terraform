output "vpc_id" {
  description = "Vpc-id"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  description = "public subnet id"
  value = {  
      for i, int in aws_subnet.public_subnet:
        i =>  int.id   
  }
  
}

output "bastion_subnet" {
  description = "subnet for bastion"
  #value = values(aws_subnet.public_subnet)[*].id #coverts the object value to lists
  # [for k in sort(keys(aws_subnet.private_subnet)) :
  # aws_subnet.private_subnet[k].id
  # ]
  value = [ for i in aws_subnet.public_subnet: i.id ]
}

output "private_subnet_id" {
  description = "private subnet id"
  value = {  
      for i, int in aws_subnet.private_subnet:
        i =>  int.id   
  }
}

output "vpc_cidr_block" {
  description = "value of vpc cidr block"
  value = aws_vpc.my_vpc.cidr_block
}

output "nat_public_ip" {
    description = "value of nat gateway eip"
    value = [ 
        for name, i in aws_nat_gateway.nat_gateway:{
            name = name
            public_ip = i.public_ip
        }
    ]
}