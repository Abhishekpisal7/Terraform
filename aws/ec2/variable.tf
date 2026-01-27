variable "region_name" {

    description = "Name of the aws region"
    type =string
    
}
variable "ami_value" {

    description = "value of ami"
    type = string
  
}

variable "instance_type_value" {

    description = "value of instance type"
    type = string
  
}

variable "key_value" {

    description = "value of the key name"
    type = string
  
}

# additional veriable type

# variable "Lists-of-String" {
#     description = "This list of String"
#     type = list(string)
#     default = [ "t2.micro", "t2.medium" ]
# }

# variable "Map-of-String" {
#     description = "This is Map of String"
#     type = map(string)
#     default = {
#       "dev" = "t2.meduim"
#       "test" = "t2.micro"
#     }  
# }
