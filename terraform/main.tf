
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


resource "google_project_organization_policy" "org_policies" {
  for_each = var.org_policies

  project    = module.project_factory.project_id
  constraint = each.key

  dynamic "list_policy" {
    for_each = [for rule in each.value.rules : rule if rule.values != null]
    content {
      allow {
        values = list_policy.value.values
      }
    }
  }

  dynamic "boolean_policy" {
    for_each = [for rule in each.value.rules : rule if rule.enforce != null]
    content {
      enforced = boolean_policy.value.enforce
    }
  }

  dynamic "restore_policy" {
    for_each = [for rule in each.value.rules : rule if rule.deny_all != null]
    content {
      default = lookup(each.value, "deny_all", "allow_all") == "TRUE" ? "DENY" : "ALLOW"
    }
  }
}

