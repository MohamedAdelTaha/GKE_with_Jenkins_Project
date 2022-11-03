output "vpc" {
    value = google_compute_network.vpc-network 
}

output "management_subnet" {
  value = google_compute_subnetwork.management-subnet
}

output "restricted_subnet" {
  value = google_compute_subnetwork.restricted-subnet
}