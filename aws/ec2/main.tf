provider "aws" {

  region = var.region_name

}

resource "aws_instance" "terraform_instance" {

  ami =var.ami_value
  instance_type = var.instance_type_value
  key_name = var.key_value
  vpc_security_group_ids = [aws_security_group.test-sg.id]
  
  tags = {
    Name = "Terraform-Instance"
    Environment = "DevOps"
    Owner = "Abhishek Pisal"
    }
    
}