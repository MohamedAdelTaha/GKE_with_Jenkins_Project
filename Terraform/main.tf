module "infra_module" {
  source = "./Infrastructure"
  projectName = var.project
}

module "bastion_module" {
  source = "./Bastion_VM"
}

module "gke_cluster_module" {
  source = "./modules/GKE_Cluster"
}
