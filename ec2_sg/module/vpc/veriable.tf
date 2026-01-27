variable "vpc_cidr_block" {
  description = "cidr_block value for vpc"
  type = string
}

variable "vpc_instance_tenancy" {
  description = "vpc instance tenancy"
  type = string
  default = "default"
}

variable "vpc_name" {
  description = "name of vpc"
  type = string
}

variable "azs" {
    description = "value of availability zone for subnet"
    type = list(string)
}

variable "public_subnet" {
    description = "value of cidr_block for public subnet"
    type = list(string)
}

variable "private_subnet" {
    description = "value of cidr_block for private subnet"
    type = list(string)
}

variable "enable_single_nat_gateway" {
  description = "wheather you want to  create an singel gateway or not"
  type = bool
  default = false
}

variable "enable_database_subnet_group" {
  description = "wheather you want to create an database subnet group"
  type = bool
  default = false
}

variable "database_subnet" {
  description = "cidr value for databas subnet"
  type = list(string)
}