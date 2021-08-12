locals {
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  google       = local.project_vars.locals.providers.google
  environment  = local.env_vars.locals.environment
}

inputs = merge(
  local.project_vars.locals,
  local.google,
  local.environment,
  local
)
