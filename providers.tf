terraform {
  required_version = "~> 1.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.16"
    }
  }

  cloud {
    hostname     = "terrakube-api.serval-mark.ts.net"
    organization = "code4romania"

    workspaces {
      tags = [
        "website-factory",
        "aws"
      ]
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      app = var.project_slug
      env = var.env
    }
  }
}
