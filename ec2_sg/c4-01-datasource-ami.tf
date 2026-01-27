data "aws_ami" "ubuntu" {
    most_recent = true
    owners = [""]

    filter {
      name = "name"
      values = [""]
    }

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }


  
}