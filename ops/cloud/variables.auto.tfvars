domain      = "delineate.io"
description = "Portray or describe (something) precisely."
location    = "London, UK"
members     = []
repos = [
  {
    name           = ".github"
    description    = "Github configuration for this organisation repos"
    topics         = ["templates", "oss"]
    default_branch = "master"
  },
  {
    name        = ".allstar"
    description = "OSSF Allstar configiration for this organisation repos"
    topics      = ["security", "oss"]
  },
  {
    name              = "delineateio-blog"
    description       = "Blog site produced using Hugo published using Vercel at https://blog.delineate.io"
    homepage_url      = "https://blog.delineate.io"
    topics            = ["hugo", "website", "vercel"]
    is_vercel_project = true
  },
  {
    name         = "delineateio-theme"
    description  = "A minimal Hugo blog theme used for https://blog.delineate.io"
    homepage_url = "https://www.hugo.io"
    topics       = ["hugo", "hugo-theme"]
  },
  {
    name              = "delineateio-www"
    description       = "Holding website hosted on Github Pages until work starts on the real website."
    homepage_url      = "https://www.delineate.io"
    topics            = ["website", "vercel"]
    is_vercel_project = true
  },
  {
    name        = "fast-api-example"
    description = "Combination of technologies to rapidly build and deploy Python APIs."
    topics      = ["fastapi", "waypoint", "python"]
  },
  {
    name        = "gcp-scheduled-function-example"
    description = "Using Terraform to provision scheduled cloud functions securely on Google Cloud"
    topics      = ["gcp", "gcp-cloud-functions", "terraform"]
  },
  {
    name        = "hashicorp-consul-kv-example"
    description = "Demonstrates centralized dynamic configuration of Go microservices without downtime."
    topics      = ["docker", "golang", "microservices"]
  },
  {
    name        = "hashicorp-packer-example"
    description = "Using Hashicorp Packer to build GCP, Digital Ocean & Docker images"
    topics      = ["devops", "digitalocean", "packer", "docker"]
  },
  {
    name        = "hashicorp-terraform-github"
    description = "GitHub organisation and repos management using Terraform Cloud"
    topics      = ["github", "terraform"]
  },
  {
    name        = "hashicorp-vagrant-rocky"
    description = "Deployment of a general purpose Rocky Linux VM using Hashicorp Vagrant"
    topics      = ["vagrant", "linux"]
  },
  {
    name        = "hashicorp-vagrant-box"
    description = "Pre-configured Vagrant Cloud box with the required tools for engineers"
    topics      = ["ansible", "devops", "vagrant", "virtualbox"]
    archived    = true
    visibility  = "private"
  },
  {
    name        = "k8s-go-tool-example"
    description = "Several k8s & container tools for development of Go services"
    topics      = ["golang", "devops", "k8s", "skaffold", "ko"]
  },
  {
    name        = "kong-example"
    description = "Multi-node Kong API Gateway deployment playground using Docker Compose"
    topics      = ["docker-compose", "kong"]
  },
  {
    name        = "multi-service-shared-cache"
    description = "Two load balanced Go services using the same redis database"
    topics      = ["golang", "redis", "traefik", "docker-compose"]
  },
  {
    name        = "ngrok-example"
    description = "Different use cases of ngrok exposing local endpoints"
    topics      = ["devops", "ngrok"]
  },
  {
    name        = "oss-template"
    description = "Template for OSS repos with a standard boilerplate"
    topics      = ["gcp", "github", "terraform"]
    is_template = true
  },
  {
    name        = "local-cloud-functions-example"
    description = "Demonstrates building and running http and pub/sub cloud functions locally"
    topics      = ["gcp", "gcp-cloud-functions", "python"]
  },
  {
    name        = "python-mongodb-api"
    description = "Example of building a Python API using FastAPI & MongoDB"
    topics      = ["fastapi", "mongodb", "python"]
  },
  {
    name        = "go-neat"
    description = "Opinionated Git utility CLI written in Go"
    topics      = ["golang", "viper", "cobra", "go-git", "zerolog"]
    visibility  = "public"
  }
]
