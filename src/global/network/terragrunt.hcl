include {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git::github.com/smsilva/terraform.git//modules/composite/network?ref=modules-composite"
}

inputs = {
  cidr_block = "10.2.0.0/17"
}
