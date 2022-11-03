output "bastion-ip" {
  value       = google_compute_instance.bastion-server.network_interface.0.network_ip
}