terraform {
  required_version = ">= 1.3.1, < 2.0.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.9.0, < 7.0.0"
    }
  }
  backend "remote" {}
}

provider "github" {}
