variable "domain" {
  description = "domain for the github organisation"
  type        = string
}

variable "description" {
  description = "description for the github organisation"
  type        = string
}

variable "location" {
  description = "location for the github organisation"
  type        = string
}

variable "members" {
  description = "list of the members for the organisation"
  type        = set(string)
}

variable "api_token" {
  description = "token for GitHub API calls"
  type        = string
}

variable "repos" {
  type = list(object({
    name              = string
    description       = string
    homepage_url      = optional(string, "")
    branch_protection = optional(bool, true)
    default_branch    = optional(string, "main")
    topics            = optional(list(string), [])
    maintainers       = optional(list(string), [])
    members           = optional(list(string), [])
    visibility        = optional(string, "public")
    is_template       = optional(bool, false)
  }))
}

locals {
  automation_user  = lower("terraform")
  billing_email    = lower("oss@${var.domain}")
  blog             = lower("https://blog.${var.domain}")
  domain           = lower(var.domain)
  email            = lower("oss@${var.domain}")
  flat_domain      = replace(local.domain, ".", "")
  twitter_username = local.flat_domain
  default_template = "${local.flat_domain}/oss-template"
  is_testing       = endswith(terraform.workspace, "-testing")
  content_folder   = local.is_testing ? "test" : "prod"
  root_team_name   = local.is_testing ? "${local.flat_domain}-testing" : local.flat_domain
}
