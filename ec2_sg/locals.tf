locals {
    description = "for bastion host"
     Bastion_host_subnet = {
        for i, inst in module.vpc.public_subnet_id:
            i => i.id
            if i == 0
    }
}