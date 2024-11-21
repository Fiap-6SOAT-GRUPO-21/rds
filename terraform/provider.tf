provider "aws" {
  region = var.region
}

provider "mongodbatlas" {
  public_key  = var.api_payments_database_credentials.atlas_public_key
  private_key = var.api_payments_database_credentials.atlas_private_key
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.4.5"
    }
  }

  backend "s3" {
  }

}
