include {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  zone = include.locals.google.zone
}

terraform {
  source = "./main.tf"
}

inputs = {
  name = local.zone
}
