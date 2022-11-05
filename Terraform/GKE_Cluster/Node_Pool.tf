resource "google_container_node_pool" "nodepool" {
  name       = "nodepool"
  cluster    = google_container_cluster.private-cluster.id
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    image_type   = "UBUNTU_CONTAINERD"

    service_account = google_service_account.node-service-account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}