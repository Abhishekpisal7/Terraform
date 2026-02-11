 module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0.1"

  name = "myvpc"
  cidr = "10.0.0.0/16"
 
  azs = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags ={
    "Name" = "Public_Subnet"
  }

  private_subnet_tags = {
    "Name" = "Private_Subnet"
  }

  database_subnet_tags = {
    "Name" = "Database_Subnet"
  }

  tags = {
    "Owner" = "Abhishek"
    "Environment" = "dev"
  }

  vpc_tags = {
    "Name" = "myvpc"
  }

}
