domain = "delineate.io"
description = "Portray or describe (something) precisely."
location = "London, UK"
admins = ["jf-delineate"]
members = []
repos = [{
    name              = ".github"
    description       = "This repo holds the Github templates to be used across all delineate.io repositories."
    topics            = ["templates"]
    branch_protection = false
  },
  {
    name              = "delineateio-www"
    description       = "Holding website hosted on Github Pages until work starts on the real website."
    topics            = ["website"]
  },
  {
    name              = "hashicorp-vagrant-box"
    description       = "Pre-configured Vagrant Cloud box with the required tools for engineers working on all www.delineate.io projects"
    topics            = ["ansible","devops","vagrant","virtualbox"]
  },
  {
    name              = "fast-api-example"
    description       = "Demonstrate a potential combination of technologies to rapidly build and deploy Python APIs."
    topics            = ["fastapi","waypoint"]
  },
  {
    name              = "gcp-scheduled-function-example"
    description       = "Demonstrate using Terraform to provision scheduled cloud functions securely on Google Cloud"
    topics            = ["gcp","terraform"]
  },
  {
    name              = "oss-template"
    description       = "This is a template for personal repos that includes standard boilerplate set up"
    topics            = ["gcp","github", "terraform"]
    is_template       = true
  },
  {
    name              = "hashicorp-packer-example"
    description       = "Examples project using Hashicorp Packer to build GCP, Digital Ocean & Docker images"
    topics            = ["devops","digitalocean", "packer"]
  },
  {
    name              = "kong-example"
    description       = "Multi-node Kong API Gateway deployment playground using Docker Compose"
    topics            = ["docker-compose","kong-gateway"]
  },
  {
    name              = "hashicorp-consul-kv-example"
    description       = "Demonstrates centralized dynamic configuration of microservices without downtime."
    topics            = ["docker","golang","microservices"]
  },
  {
    name              = "hashicorp-vagrant-rocky"
    description       = "This repo provisions a general purpose Rocky Linux VM using Hashicorp Vagrant.."
    topics            = ["vagrant"]
  },
  {
    name              = "ngrok-example"
    description       = "This repo provides an example of using ngrok"
    topics            = ["devops"]
  },
  {
    name              = "delineateio-blog"
    description       = "Blog site produced using Hugo published using Vercel at https://blog.delineate.io"
    homepage_url      = "https://blog.delineate.io"
    topics            = ["hugo", "website"]
  },
  {
    name              = "delineateio-theme"
    description       = "A minimal Hugo blog theme used for https://blog.delineate.io"
    homepage_url      = "https://www.hugo.io"
    topics            = ["hugo", "hugo-theme"]
  },
  {
    name              = "multi-service-shared-cache"
    description       = "This repo demonstrates load balanced services using redis"
    topics            = ["golang", "redis"]
  },
  {
    name              = "k8s-go-tool-example"
    description       = "This repo shows several k8s and container tools for golang used together for a development workflow"
    topics            = ["golang", "devops", "k8s"]
  },
  {
    name              = "hashicorp-terraform-github"
    description       = "This repo manages GitHub organisation and repos using Terraform Cloud"
    topics            = ["github", "terraform"]
  }
]
