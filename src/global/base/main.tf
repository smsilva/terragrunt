locals {
  separator_1 = (var.prefix != "" ? "-" : "")
  separator_2 = (var.suffix != "" ? "-" : "")

  prefix = "${var.prefix}${local.separator_1}"
  suffix = "${local.separator_2}${var.suffix}"
}

resource "null_resource" "creator" {
  triggers = {
    name = "${local.prefix}${var.name}${local.suffix}"
  }
}
