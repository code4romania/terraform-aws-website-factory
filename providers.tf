terraform {
  required_version = "~> 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.86"
    }
  }

  cloud {
    organization = "onghub"

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
