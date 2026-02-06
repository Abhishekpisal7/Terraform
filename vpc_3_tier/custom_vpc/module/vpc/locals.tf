locals {
  target_azs = var.enable_single_nat_gateway? [var.azs[0]] : var.azs
  local_values =  var.enable_single_nat_gateway? zipmap(var.azs, [for k in var.azs: var.azs[0]]):zipmap(var.azs, local.target_azs)
}
