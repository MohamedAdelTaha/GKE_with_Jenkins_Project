resource "google_service_account" "bastion-service-account" {
  account_id = "bastion-service-account"
}

resource "google_project_iam_binding" "bastion-service-account-iam" {
  project = "mohamedadel"
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.bastion-service-account.email}",
  ]
}