# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "this" {
  name                                    = local.name
  description                             = local.decription
  homepage_url                            = local.homepage_url
  visibility                              = local.visibility
  has_issues                              = true
  has_projects                            = false
  has_wiki                                = false
  allow_merge_commit                      = false
  allow_squash_merge                      = true
  allow_rebase_merge                      = false
  squash_merge_commit_title               = "PR_TITLE"
  squash_merge_commit_message             = "PR_BODY"
  delete_branch_on_merge                  = true
  archive_on_destroy                      = true
  topics                                  = var.topics
  vulnerability_alerts                    = true
  ignore_vulnerability_alerts_during_read = false
  is_template                             = var.is_template
  auto_init                               = var.is_template
  dynamic "template" {
    for_each = var.is_template ? [] : [1]
    content {
      owner      = local.template_owner
      repository = local.template_name
    }
  }
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default
resource "github_branch_default" "default" {
  repository = github_repository.this.name
  branch     = var.default_branch
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection
resource "github_branch_protection" "this" {
  count                           = local.branch_protection ? 1 : 0
  repository_id                   = github_repository.this.node_id
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
