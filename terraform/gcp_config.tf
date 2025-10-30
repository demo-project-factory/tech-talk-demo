
resource "google_project_iam_binding" "project_iam" {
  for_each = var.iam_bindings
  project  = module.project_factory.project_id
  role     = each.key
  members  = each.value
}