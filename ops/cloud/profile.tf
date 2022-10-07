# https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository
data "github_repository" "github" {
  full_name = "${local.flat_domain}/.github"
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file
resource "github_repository_file" "profile" {
  repository          = data.github_repository.github.name
  branch              = "main"
  file                = "profile/README.md"
  content             = file("${path.module}/content/github/profile/README.md")
  commit_message      = "Profile updated on '${timestamp()}'"
  commit_author       = local.automation_user
  commit_email        = "${local.automation_user}@${local.domain}"
  overwrite_on_create = true

  # ignore the commit message as it has a timestamp in it
  # that if that is the only change should not be applied
  lifecycle {
    ignore_changes = [
      commit_message
    ]
  }
}
