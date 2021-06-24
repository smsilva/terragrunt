include {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git::github.com/smsilva/terraform.git//modules/composite/cluster?ref=modules-composite"
}

inputs = {
  base_cidr_block = "192.168.1.0/17"
}
