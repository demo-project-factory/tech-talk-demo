project_name = "test"
folder_id    = "folders/766069960998"


project_services = [
  "serviceusage.googleapis.com",
  "compute.googleapis.com",
]


labels = {
  team        = "prod"
  purpose     = "dss-testing"
  environment = "produccion"
}

org_policies = {
  "compute.trustedImageProjects" = "projects/my-trusted-project"
}