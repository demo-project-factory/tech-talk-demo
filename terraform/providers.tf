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
