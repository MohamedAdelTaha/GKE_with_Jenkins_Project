resource "google_compute_network" "vpc-network" {
  project                 = var.projectName
  name                    = var.vpcName
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}
