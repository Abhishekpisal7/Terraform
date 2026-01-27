output "Instance-ID" {

    value = aws_instance.terraform_instance.id
    description = "value of the instance id"
  
}

output "Public-IP" {

    value = aws_instance.terraform_instance.public_ip
    description = "value of the public ip"
    
}