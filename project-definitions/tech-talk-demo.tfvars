project_name = "tech-talk-demo"
folder_id    = "folders/766069960998"


project_services = [
  "serviceusage.googleapis.com",
  "compute.googleapis.com",
  "container.googleapis.com",
  "cloudbuild.googleapis.com",
  "artifactregistry.googleapis.com",
  "run.googleapis.com",
  "iam.googleapis.com"
]


iam_bindings = {
  "roles/viewer" = ["user:raul.makendengue@devotream.com"]
}

org_policies = {
  "compute.vmExternalIpAccess" = {
    rules = [{
      deny_all = "TRUE"
    }]
  },
  "iam.allowedPolicyMemberDomains" = {
    rules = [{
      values = [
        "devoteam.com"
      ]
    }]
  }
}