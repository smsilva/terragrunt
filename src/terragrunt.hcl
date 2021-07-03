remote_state {
  backend = "gcs"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket               = "${get_env("BUCKET_NAME", "silvios")}"
    prefix               = "${get_env("PROJECT_NAME", "default")}/${path_relative_to_include()}"
    skip_bucket_creation = true
  }
}

locals {
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  google       = local.project_vars.locals.providers.google
  environment  = local.env_vars.locals.environment
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "${local.google.version}"
    }
  }
}

provider "google" {
  project = "${local.google.project}"
  region  = "${local.google.region}"
  zone    = "${local.google.zone}"
}
EOF
}

inputs = merge(
  local.project_vars.locals,
  local.google,
  local.environment,
  local
)
