locals {
  all_repos      = { for r in var.repos : r.name => r }
  filtered_repos = local.is_testing ? { for k, v in local.all_repos : k => v if k != "oss-template" } : local.all_repos
}

module "github" {
  for_each = local.filtered_repos

  source = "./modules/repository"

  root_team_name    = local.root_team_name
  flat_domain       = local.flat_domain
  name              = each.value.name
  description       = each.value.description
  homepage_url      = each.value.homepage_url
  default_branch    = each.value.default_branch
  branch_protection = each.value.branch_protection
  topics            = each.value.topics
  maintainers       = each.value.maintainers
  members           = each.value.members
  visibility        = each.value.visibility
  is_template       = each.value.is_template
  default_template  = each.value.is_template ? "" : local.default_template
  is_testing        = local.is_testing

  # make sure org changes are made before applying repos
  depends_on = [
    github_organization_settings.this
  ]
}
