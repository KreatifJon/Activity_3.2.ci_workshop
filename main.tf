terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "plainjon-tfstate"
    key    = "workshop/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "workshop" {
  bucket_prefix = var.bucket_prefix

  # checkov:skip=CKV_AWS_20: "Versioning not required for workshop"
  # checkov:skip=CKV_AWS_21: "Logging not required for workshop"
}

# trigger workflow from feature branch
# test change
