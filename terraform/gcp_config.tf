
resource "google_project_iam_binding" "project_iam" {
  for_each = var.iam_bindings
  project  = module.project_factory.project_id
  role     = each.key
  members  = each.value
}


resource "google_compute_shared_vpc_service_project" "attachment" {
  provider = google.host
  count    = var.shared_vpc_host_project_id != null ? 1 : 0

  host_project    = var.shared_vpc_host_project_id
  service_project = module.project_factory.project_id
}

resource "google_compute_subnetwork_iam_member" "network_user_access" {
  provider = google.host

  for_each   = toset(var.shared_vpc_subnets_to_attach)
  subnetwork = each.key

  role   = "roles/compute.networkUser"
  member = var.shared_vpc_iam

  depends_on = [google_compute_shared_vpc_service_project.attachment]
}
