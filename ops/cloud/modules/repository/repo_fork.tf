locals {
  json_response = var.is_testing ? jsondecode(restapi_object.this[0].api_response) : null
  fork_node_id  = var.is_testing ? local.json_response.node_id : ""
}

resource "restapi_object" "this" {
  count = var.is_testing ? 1 : 0
  path  = "/repos/${var.flat_domain}/${local.name}/forks"
  data  = jsonencode({ "organization" = "${var.flat_domain}-testing", "name" = "${local.name}", "default_branch_only" = true })
}
