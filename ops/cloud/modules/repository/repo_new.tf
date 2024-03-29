# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "this" {
  name                                    = local.name
  description                             = local.description
  homepage_url                            = local.homepage_url
  visibility                              = local.visibility
  archived                                = var.archived
  has_issues                              = true
  has_projects                            = false
  has_wiki                                = false
  allow_merge_commit                      = false
  allow_squash_merge                      = false
  allow_rebase_merge                      = true
  allow_auto_merge                        = true
  allow_update_branch                     = true
  squash_merge_commit_title               = "PR_TITLE"
  squash_merge_commit_message             = "PR_BODY"
  delete_branch_on_merge                  = var.is_vercel_project || var.archived ? false : true
  archive_on_destroy                      = false
  topics                                  = var.topics
  vulnerability_alerts                    = var.archived ? false : true
  ignore_vulnerability_alerts_during_read = false
  is_template                             = var.is_template
  auto_init                               = var.is_template
  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }

  dynamic "template" {
    for_each = var.is_template ? [] : [1]
    content {
      owner      = local.template_owner
      repository = local.template_name
    }
  }
}
