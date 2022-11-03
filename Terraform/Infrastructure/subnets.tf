########## Management subnet for VMs ##########
resource "google_compute_subnetwork" "management-subnet" {
  name                     = "management-subnet"
  ip_cidr_range            = var.managementSubnetCidr
  region                   = var.region
  network                  = google_compute_network.vpc-network.id
  private_ip_google_access = true 
}


########## Private subnet for GKE Cluster ##########
resource "google_compute_subnetwork" "restricted-subnet" {
  name                     = "restricted-subnet"
  ip_cidr_range            = var.restrictedSubnetCidr
  region                   = var.region
  network                  = google_compute_network.vpc-network.id
}