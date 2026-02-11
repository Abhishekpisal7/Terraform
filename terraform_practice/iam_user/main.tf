provider "aws" {

    region = "ap-south-1"
  
}

locals {
  
  use_data = yamldecode(file("./users.yaml")).users

 user_role_pair = flatten([for user in local.use_data : [for policies in user.policies : {
    username = user.username
    policies   = policies
  }]])
}

output "names" {
    
  #value = local.use_data
  value = local.user_role_pair
  
}
# Crate IAM users from the YAML file

resource "aws_iam_user" "name" {
    for_each = toset(local.use_data[*].username)
    name     = each.value  
}

resource "aws_iam_user_login_profile" "profile" {

    for_each = aws_iam_user.name
    user = each.value.name
    password_length = 12

}

resource "aws_iam_user_policy_attachment" "userofpolicy" {

  for_each = {
    for pair in local.user_role_pair :
    "${pair.username}-${pair.policies}" => pair
  }

  user       = aws_iam_user.name[each.value.username].name
  policy_arn = "arn:aws:iam::aws:policy/${each.value.policies}"
  
}