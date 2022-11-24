terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.20.0"
    }
    archive = {
      source  = "hashicorp/random"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "devopsthehardway-ecr-repo" {
  name                 = "${var.repo_name}-${var.environment}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}