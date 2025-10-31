project_name = "tech-talk-demo8684"
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

enable_cicd_bootstrap = true 
github_repo = "tech-talk-demo2"
github_owner = "demo-project-factory"