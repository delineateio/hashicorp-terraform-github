output "current_workspace_name" {
  value = terraform.workspace
}

output "is_testing" {
  value = local.is_testing
}
