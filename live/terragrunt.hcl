remote_state {
  backend = "gcs"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket               = "silvios"
    prefix               = "terragrunt/${path_relative_to_include()}"
    skip_bucket_creation = true
  }
}

locals {
  bucket_vars = read_terragrunt_config(find_in_parent_folders("bucket.hcl"))
  project     = local.bucket_vars.locals.project
  region      = local.bucket_vars.locals.region
  zone        = local.bucket_vars.locals.zone
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
