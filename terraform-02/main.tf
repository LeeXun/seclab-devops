terraform {
  required_version = ">= 0.12.2"
}

provider "google" {
  project = "" # Add this
  region  = "" # Add this
  version = "~> 3.21"
}
