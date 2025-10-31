project_name = "tech-talk-demo841325"
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
  "roles/viewer" = ["user:raul.makendengue@devoteam.com"]
}

org_policies = {
  "compute.disableNestedVirtualization" = {
    rules = [{
      enforce = true
    }]
  },
  "compute.restrictResourceManagerProjects" = {
    rules = [{
      allow = {
        values = [
          "projects/dvt-obs-demo-prj"
        ]
      }
    }]
  }
}

enable_cicd_bootstrap = true 
github_repo = "tech-talk-demo2"
github_owner = "demo-project-factory"