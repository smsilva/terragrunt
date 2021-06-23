remote_state {
  backend = "gcs"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket               = "silvios"
    prefix               = "${path_relative_to_include()}/state"
    skip_bucket_creation = true
  }
}

locals {
  project = get_env("GOOGLE_PROJECT")
  region  = get_env("GOOGLE_REGION")
  zone    = get_env("GOOGLE_ZONE")
}

inputs = merge(
  local
)

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.72.0"
    }
  }
}

provider "google" {
  project = "${local.project}"
  region  = "${local.region}"
  zone    = "${local.zone}"
}
EOF
}

generate "null_resource" {
  path      = "tg.main.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
resource "null_resource" "null" {
}
EOF
}
