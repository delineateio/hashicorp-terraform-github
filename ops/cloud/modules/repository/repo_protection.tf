# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default
resource "github_branch_default" "default" {
  repository = local.name
  branch     = var.default_branch
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection
resource "github_branch_protection" "this" {
  count                           = local.branch_protection ? 1 : 0
  repository_id                   = var.is_testing ? local.fork_node_id : github_repository.this[0].node_id
  pattern                         = github_branch_default.default.branch
  enforce_admins                  = false
  allows_deletions                = false
  require_signed_commits          = true
  allows_force_pushes             = false
  required_linear_history         = true
  require_conversation_resolution = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    dismissal_restrictions          = []
    pull_request_bypassers          = []
    require_code_owner_reviews      = false
    required_approving_review_count = 1
    restrict_dismissals             = true
  }
}
