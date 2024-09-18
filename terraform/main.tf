data "aws_ssm_parameter" "vpc_id" {
  name = "/techchallenge/eks/vpc_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/techchallenge/eks/public_subnet_ids"
}

# RDS
module "rds" {
  source             = "./modules/rds"
  region             = var.region
  availability_zone  = var.availability_zones[0]
  vpc_id             = data.aws_ssm_parameter.vpc_id.value
  database_subnetids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  database_username  = var.database_credentials.username
  database_password  = var.database_credentials.password
  database_port      = var.database_credentials.port
  database_name      = var.database_credentials.name
}

resource "aws_ssm_parameter" "rds_db_url" {
  name  = "/techchallenge/rds/db_url"
  type  = "String"
  value = module.rds.rds_endpoint
}

resource "aws_ssm_parameter" "rds_db_username" {
  name  = "/techchallenge/rds/db_username"
  type  = "String"
  value = var.database_credentials.username
}

resource "aws_ssm_parameter" "rds_db_password" {
  name  = "/techchallenge/rds/db_password"
  type  = "SecureString"
  value = var.database_credentials.password
}

resource "aws_ssm_parameter" "rds_db_port" {
  name  = "/techchallenge/rds/db_port"
  type  = "String"
  value = var.database_credentials.port
}

resource "aws_ssm_parameter" "rds_db_name" {
  name  = "/techchallenge/rds/db_name"
  type  = "String"
  value = var.database_credentials.name
}