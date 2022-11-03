resource "google_service_account" "node-service-account" {
  account_id = "node-service-account"
}

resource "google_project_iam_binding" "node-service-account-iam" {
  project = "mohamedadel"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.node-service-account.email}",
  ]
}