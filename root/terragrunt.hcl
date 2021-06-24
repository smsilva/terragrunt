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
  provider_vars = read_terragrunt_config(find_in_parent_folders("provider.hcl"))
  provider = {
    project = local.provider_vars.locals.project
    region  = local.provider_vars.locals.region
    zone    = local.provider_vars.locals.zone
  }
}

inputs = merge(
  local.provider_vars,
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
  project = "${local.provider.project}"
  region  = "${local.provider.region}"
  zone    = "${local.provider.zone}"
}
EOF
}
