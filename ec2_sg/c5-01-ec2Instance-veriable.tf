#veriable for ami

variable "instance_type" {
    description = "Value of ami-id"
    type = string
    default = "t2.micro"
}

variable "keyname" {
   description = "key name for bastion host"
   type = string
   default = "demo"
}