resource "null_resource" "creator" {
  triggers = {
    name = "prefix-${var.name}-sufix"
  }
}
