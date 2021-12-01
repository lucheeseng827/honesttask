terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.67.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "mancube"

    workspaces {
      name = "aws-honest-poc"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
