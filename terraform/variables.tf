variable "region" {
  description = "AWS region to deploy to"
  default     = "us-east-1"
  type        = string
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "List of availability zones for the selected region"
}

variable "api_food_database_credentials" {
  description = "Credentials for database creation"

  type = object({
    username = string
    password = string
    port     = string
    name     = string
  })

  default = {
    username = "postgres"
    password = "postgres"
    port     = 5432
    name     = "apifood"
  }
}

variable "api_order_database_credentials" {
  description = "Credentials for database creation"

  type = object({
    username = string
    password = string
    port     = string
    name     = string
  })

  default = {
    username = "postgres"
    password = "postgres"
    port     = 5432
    name     = "apiorder"
  }
}

variable "api_payments_database_credentials" {
  description = "Credentials for database creation"

  type = object({
    atlas_public_key  = string
    atlas_private_key = string
    org_id            = string
    cidr              = string
    project_name      = string
    cluster_name      = string
    database_name     = string
    username          = string
    password          = string
  })

  default = {
    atlas_public_key  = "xmoxoiiv"
    atlas_private_key = "ea79dd6a-b1a7-4eab-ba50-8df70f65d377"
    org_id            = "60993d1464a3ec080ffc5b9a"
    cidr              = "0.0.0.0/0"
    project_name      = "tech-challenge-payments"
    cluster_name      = "api-payments-cluster"
    database_name     = "apipayments"
    username          = "admin"
    password          = "admin"
  }
}