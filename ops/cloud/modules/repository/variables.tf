variable "flat_domain" {
  description = "flattened domain of the github organisation"
  type        = string
}

variable "root_team_name" {
  description = "name of the root team in the organisation"
  type        = string
}

variable "name" {
  description = "name of the github repo"
  type        = string
}

variable "description" {
  description = "description of the github repo"
  type        = string
}

variable "homepage_url" {
  description = "home url fpr the github repo"
  type        = string
}

variable "topics" {
  description = "list of topics to add to the github repo"
  type        = list(string)
}

variable "default_branch" {
  description = "default branch name for the github repo"
  type        = string
}

variable "branch_protection" {
  description = "indicates if branch protection should be created"
  type        = bool
}

variable "maintainers" {
  description = "list of maintainers for the github repo"
  type        = set(string)
}

variable "members" {
  description = "list of members for the github repo"
  type        = set(string)
}

variable "visibility" {
  description = "visibility of the github repo"
  type        = string
}

variable "archived" {
  description = "indicated if github repo is archived"
  type        = string
}

variable "is_template" {
  description = "indicates if template github repo"
  type        = bool
}

variable "default_template" {
  description = "template to use for the github repo"
  type        = string
}

variable "is_vercel_project" {
  description = "indicates if this is a vercel project"
  type        = bool
}

variable "is_testing" {
  description = "indicates if this run is a testing run"
  type        = bool
}

locals {
  root_team_name    = lower(var.root_team_name)
  template_parts    = split("/", var.default_template)
  template_owner    = var.is_template ? "" : lower(local.template_parts[0])
  template_name     = var.is_template ? "" : lower(local.template_parts[1])
  name              = lower(var.name)
  description       = var.description
  homepage_url      = lower(var.homepage_url)
  visibility        = lower(var.visibility)
  branch_protection = local.visibility == "public" && var.branch_protection
}
