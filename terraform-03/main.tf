terraform {
  required_version = ">= 0.12.24"
}

provider "google" {
  project = "???" # GCP project name
  region  = "asia-east1"    # You can use asia-east1 or choose your own region.
  version = "~> 3.21"
}

provider "random" {
}

resource "random_id" "instance-template" {
  keepers = {
    ami_id = local.image
  }
  byte_length = 8
}

locals {
  project = "???"
  region  = "???"
  image   = "???" # Add these
}
