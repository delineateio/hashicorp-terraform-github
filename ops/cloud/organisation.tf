# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_settings
resource "github_organization_settings" "this" {
  billing_email                                            = local.billing_email
  blog                                                     = local.blog
  email                                                    = local.email
  twitter_username                                         = local.twitter_username
  location                                                 = var.location
  name                                                     = local.is_testing ? "${var.domain} (testing)" : var.domain
  description                                              = var.description
  has_organization_projects                                = false
  has_repository_projects                                  = false
  default_repository_permission                            = "read"
  members_can_create_repositories                          = true
  members_can_create_public_repositories                   = true
  members_can_create_private_repositories                  = false
  members_can_create_internal_repositories                 = false
  members_can_create_pages                                 = false
  members_can_create_public_pages                          = false
  members_can_create_private_pages                         = false
  members_can_fork_private_repositories                    = false
  web_commit_signoff_required                              = true
  dependabot_alerts_enabled_for_new_repositories           = true
  dependabot_security_updates_enabled_for_new_repositories = true
  dependency_graph_enabled_for_new_repositories            = true
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team
resource "github_team" "root" {
  name        = local.root_team_name
  description = "This is the overall team for ${local.root_team_name}"
  privacy     = "closed"
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership
resource "github_membership" "admins" {
  for_each = var.admins
  username = each.key
  role     = "admin"
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership
resource "github_membership" "members" {
  for_each = var.members
  username = each.key
  role     = "member"
}
