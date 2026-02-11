provider "aws" {

    region = "ap-south-1"
  
}

resource "aws_instance" "Test_instance" {
    
    count = 2
    ami = "ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
    key_name = "newkey"

    tags = {
        Name = "Test_Instance_${count.index + 1}"
    }
  
}

output "Instance_ip" {

    value = [
        for i , inst in aws_instance.Test_instance : {
           "Test_instance_${i}" = inst.public_ip
        }
    ]
   
}
