
resource "google_project_iam_binding" "project_iam" {
  for_each = var.iam_bindings
  project  = module.project_factory.project_id
  role     = each.key
  members  = each.value
}

resource "google_project_organization_policy" "project_policies" {
  for_each = var.org_policies
  project  = module.project_factory.project_id
  constraint = each.key

  list_policy {
    allow {
      all = true
    }
  }
}