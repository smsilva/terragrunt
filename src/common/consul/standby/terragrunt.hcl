include {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git::github.com/smsilva/terraform.git//modules/composite/cluster?ref=modules-composite"
}

dependency "global_network" {
  config_path = "${get_parent_terragrunt_dir()}/global/network"

  mock_outputs = {
    id          = "temporary-dummy-id"
    cidr_subnet = ""
  }
}

inputs = {
  base_cidr_block = "192.168.1.0/17"
}
