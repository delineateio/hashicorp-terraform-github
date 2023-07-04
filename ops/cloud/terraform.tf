terraform {
  required_version = ">= 1.3.1, < 2.0.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.9.0, < 6.0.0"
    }
    restapi = {
      source  = "registry.terraform.io/mastercard/restapi"
      version = ">= 1.17.0, < 2.0.0"
    }
  }
  backend "remote" {}
}

provider "github" {}

provider "restapi" {
  uri = "https://api.github.com/"
  headers = {
    Accept        = "application/vnd.github+json"
    Authorization = "Bearer  ${var.api_token}"
  }
  write_returns_object = true
}
