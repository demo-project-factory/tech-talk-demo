resource "google_storage_bucket" "tfstate_backend" {
  count = var.enable_cicd_bootstrap ? 1 : 0

  project                     = module.project_factory.project_id
  name                        = "${module.project_factory.project_id}-tfstate"
  location                    = "europe-west1"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_iam_workload_identity_pool" "github_pool" {
  count = var.enable_cicd_bootstrap ? 1 : 0

  project                   = module.project_factory.project_id
  workload_identity_pool_id = "github-pool"
  display_name              = "GitHub Actions Identity Pool"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  count = var.enable_cicd_bootstrap ? 1 : 0

  project                            = module.project_factory.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool[0].workload_identity_pool_id
  workload_identity_pool_provider_id = "github-provider"
  display_name                       = "GitHub Actions Provider"
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }
    attribute_condition = "attribute.repository == '${var.github_owner}/${var.github_repo}'"

}

resource "google_service_account" "cicd_runner_sa" {
  count = var.enable_cicd_bootstrap ? 1 : 0

  project      = module.project_factory.project_id
  account_id   = "cicd-runner-sa"
  display_name = "CI/CD Service Account"
}

resource "google_service_account_iam_member" "sa_workload_identity_user" {
  count = var.enable_cicd_bootstrap ? 1 : 0

  service_account_id = google_service_account.cicd_runner_sa[0].name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool[0].name}/attribute.repository/${var.github_owner}/${var.github_repo}"
}

resource "google_project_iam_member" "sa_predefined_roles" {
  for_each = var.enable_cicd_bootstrap ? toset(var.sa_predefined_roles) : toset([])

  project = module.project_factory.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.cicd_runner_sa[0].email}"
}
