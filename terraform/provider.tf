provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48"
    }
  }

  backend "s3" {
    key = var.terraform_s3_key
    region = var.region
  }

}
