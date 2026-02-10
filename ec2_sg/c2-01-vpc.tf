module "vpc" {

    source = "./module/vpc"
    vpc_name = var.vpc_name
    vpc_cidr_block = var.vpc_cidr_block
    azs = var.azs
    public_subnet = var.public_subnet
    private_subnet = var.private_subnet

    enable_single_nat_gateway = var.enable_single_nat_gateway

    enable_database_subnet_group = var.enable_database_subnet_group
    database_subnet = var.database_subnet
    
}