terraform {
  backend "gcs" {
    bucket = "gcs-demo-project-factory"
    prefix = "project/factory"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {}

provider "google" {
  alias   = "host"
  project = var.shared_vpc_host_project_id
}
