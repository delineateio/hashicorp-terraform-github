terraform {
  required_version = ">= 1.3.1, < 2.0.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.3.0, < 6.0.0"
    }
  }
  backend "remote" {
    organization = "delineateio"
    workspaces {
      name = "github-delineateio"
    }
  }
}

provider "github" {}
