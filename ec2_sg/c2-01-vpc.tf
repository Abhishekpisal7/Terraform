module "vpc" {

    source = "./module/vpc"
    vpc_name = "prod"
    vpc_cidr_block = "10.0.0.0/16"
    azs = [ "ap-south-1a", "ap-south-1b" ]
    public_subnet = [ "10.0.1.0/24", "10.0.2.0/24" ]
    private_subnet = [ "10.0.3.0/24", "10.0.4.0/24" ]

    enable_single_nat_gateway = true

    enable_database_subnet_group = true
    database_subnet = ["10.0.50.0/24", "10.0.60.0/24"]
  
}