
output "bastion_host_instance_id" {
  description = "Instance id for bastion host"
  value = aws_instance.Bastion_host[*].id
}

output "bastion_public_ip" {
  description = "public_ip of bastion host"
  value = aws_instance.Bastion_host[*].public_ip
}

# for pubilc server
output "public_server_id" {
  description = "public server instance id"
  value = [
    for i in aws_instance.public_server:{
        id = i.id
    }

  ]
}

output "pubilc_server_ip" {
  description = "Public server ip"
  value = [
    for i in aws_instance.public_server:{
        id = i.public_ip
    }

  ]
}

#for private server
output "private_server_id" {
  description = "pivate server instance ip"
  value = [
  for i in aws_instance.private_server:{
       id = i.id
    }

  ]
}

output "private_server_ip" {
  description = "Id for private server"
  value = [
    for i in aws_instance.private_server:{
        id = i.public_ip
    }

  ]
}