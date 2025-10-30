project_name = "test-project-5"
folder_id    = "folders/766069960998"

project_services = [
  "serviceusage.googleapis.com",
  "compute.googleapis.com",
]

labels = {
  team        = "test"
  purpose     = "testing"
  environment = "development"
}

iam_bindings = {
  "roles/owner" = [
    "user:raul.makendengue@devoteam.com",
  ]
}

org_policies = {
  "compute.trustedImageProjects" = "projects/my-trusted-project"
}