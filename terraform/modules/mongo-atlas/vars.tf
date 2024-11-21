variable "database_username" {
  description = "Username for the master DB user."
  type        = string
}
variable "database_password" {
  description = "password of the database"
  type        = string
}

variable "database_name" {
  type    = string
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "org_id" {
  type        = string
  description = "Organization ID"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "atlas_public_key" {
  type        = string
  description = "MongoDB Atlas Public API Key"
}

variable "atlas_private_key" {
  type        = string
  description = "MongoDB Atlas Private API Key"
}

variable "cidr" {
    type        = string
    description = "CIDR block"
}