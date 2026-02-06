#vpc_id
output "vpc-id" {
    description = "vpc-id"
    value = module.vpc.vpc_id
}

output "public_subnet" {
    description = "public_subnet"
    value = module.vpc.public_subnet_id
}

output "private_subnet" {
    description = "private_subnet"
    value = module.vpc.private_subnet_id
}

output "vpc_cidr_block" {
    description = " Value of Vpc cidr block"
    value = module.vpc.vpc_cidr_block
}

output "nat_public_ip" {
    description = "value of nat gateway eip"
    value = module.vpc.nat_public_ip
}