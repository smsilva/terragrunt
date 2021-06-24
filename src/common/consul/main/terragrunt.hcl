include {
  path   = find_in_parent_folders()
  expose = true
}

dependency "global_network" {
  config_path = "${get_parent_terragrunt_dir()}/global/network"

  mock_outputs = {
    id          = "temporary-dummy-id"
    cidr_subnet = "temporary-dummy-cidr_subnet"
  }
}

terraform {
  source = "git::github.com/smsilva/terraform.git//modules/composite/cluster?ref=modules-composite"
}

inputs = {
  base_cidr_block = "10.1.0.0/17"
}
