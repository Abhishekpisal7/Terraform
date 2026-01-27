provider "aws" {

    region = "ap-south-1"
  
}

resource "aws_instance" "Test_instance" {
    
    for_each = toset(["Test","Production"])
    ami = "ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
    key_name = "newkey"

    tags = {
        Name = "${each.key}_Instance"
    }
  
}

output "instance_ip" {
    value = [ 
        for name, inst in aws_instance.Test_instance: {
            name = name
            public_ip = inst.public_ip
        }
    ]
}