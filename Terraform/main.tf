module "infra_module" {
  source = "./Infrastructure"
  projectName = var.project
}

module "bastion_module" {
  source = "./Bastion_VM"
  vpc_id            = module.infra_module.vpc.id
  management_subnet = module.infra_module.management_subnet.id
}
module "gke_cluster_module" {
  source = "./GKE_Cluster"
  network = module.infra_module.vpc.self_link
  subnetwork = module.infra_module.restricted_subnet.self_link
}
