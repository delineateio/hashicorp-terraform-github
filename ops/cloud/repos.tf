module "github" {
  for_each = { for r in var.repos : r.name => r }

  source = "./modules/repository"

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
}
