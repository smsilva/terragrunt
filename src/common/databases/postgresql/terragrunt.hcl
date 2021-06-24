include {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git::github.com/smsilva/terraform.git//modules/app?ref=modules-composite"
}

inputs = {
  name = "postgresql"
}
