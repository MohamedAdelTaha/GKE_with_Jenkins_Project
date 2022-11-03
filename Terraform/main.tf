module "infra_module" {
  source = "./Infrastructure"
}

module "bastion_module" {
  source = "./Bastion_VM"
}