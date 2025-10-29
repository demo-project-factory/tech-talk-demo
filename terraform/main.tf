
module "project_factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 18.0"

  name              = var.project_name
  random_project_id = true
  billing_account   = var.billing_account
  org_id            = var.organization_id
  folder_id         = var.folder_id
  activate_apis     = var.project_services
  labels            = var.labels

}

