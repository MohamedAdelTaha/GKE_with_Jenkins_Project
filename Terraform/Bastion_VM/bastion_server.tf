
resource "google_compute_instance" "bastion-server" {
  name                      = "bastion-server"
  machine_type              = "e2-medium"
  zone                      = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size  = "10"
    }
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.management_subnet
  }

  service_account {
    email  = google_service_account.bastion-service-account.email
    scopes = ["cloud-platform"]
  }
}