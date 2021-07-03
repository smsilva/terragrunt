include {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  google_vars = include.locals.google
  project     = local.google_vars.project
  region      = local.google_vars.region
  environment = include.locals.environment
}

terraform {
  source = "main.tf"
}

inputs = {
  prefix = "${local.environment.name}"
  name   = "${local.region}"
  suffix = "base"
}
