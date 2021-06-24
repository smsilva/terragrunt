variable "name" {
  default = "database"
}

resource "null_resource" "creator" {
  triggers = {
    name = "prefix-${var.name}-sufix"
  }
}

output "id" {
  value = null_resource.creator.triggers.name
}
