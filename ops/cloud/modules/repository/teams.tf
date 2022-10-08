data "github_team" "root" {
  slug = local.root_team_name
}

resource "github_team" "maintainers" {
  count          = length(var.maintainers) > 0 ? 1 : 0
  name           = "${local.name}-maintainers"
  parent_team_id = data.github_team.root.id
  description    = "maintainers for the '${local.name}' repo"
  privacy        = "closed"
}

resource "github_team_membership" "maintainers" {
  for_each = var.maintainers
  team_id  = github_team.maintainers[0].id
  username = each.key
  role     = "maintainer"
}

resource "github_team" "members" {
  count          = length(var.members) > 0 ? 1 : 0
  name           = "${local.name}-members"
  parent_team_id = data.github_team.root.id
  description    = "members for the '${local.name}' repo"
  privacy        = "closed"
}

resource "github_team_membership" "members" {
  for_each = var.members
  team_id  = github_team.members[0].id
  username = each.key
  role     = "member"
}
