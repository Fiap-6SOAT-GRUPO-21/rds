data "aws_ssm_parameter" "vpc_id" {
  name = "/techchallenge/eks/vpc_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/techchallenge/eks/public_subnet_ids"
}

# RDS API-FOOD
module "api_food_rds" {
  source            = "./modules/postgres"
  region            = var.region
  availability_zone = var.availability_zones[0]
  vpc_id            = data.aws_ssm_parameter.vpc_id.value
  database_subnetids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  database_username = var.api_food_database_credentials.username
  database_password = var.api_food_database_credentials.password
  database_port     = var.api_food_database_credentials.port
  database_name     = var.api_food_database_credentials.name
}

resource "aws_ssm_parameter" "rds_food_db_url" {
  name  = "/techchallenge/api_food/rds/db_url"
  type  = "String"
  value = module.api_food_rds.rds_endpoint
}

resource "aws_ssm_parameter" "rds_food_db_username" {
  name  = "/techchallenge/api_food/rds/db_username"
  type  = "String"
  value = var.api_food_database_credentials.username
}

resource "aws_ssm_parameter" "rds_food_db_password" {
  name  = "/techchallenge/api_food/rds/db_password"
  type  = "SecureString"
  value = var.api_food_database_credentials.password
}

resource "aws_ssm_parameter" "rds_food_db_port" {
  name  = "/techchallenge/api_food/rds/db_port"
  type  = "String"
  value = var.api_food_database_credentials.port
}

resource "aws_ssm_parameter" "rds_food_db_name" {
  name  = "/techchallenge/api_food/rds/db_name"
  type  = "String"
  value = var.api_food_database_credentials.name
}


# RDS API-ORDER
module "api_order_rds" {
  source            = "./modules/postgres"
  region            = var.region
  availability_zone = var.availability_zones[0]
  vpc_id            = data.aws_ssm_parameter.vpc_id.value
  database_subnetids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  database_username = var.api_order_database_credentials.username
  database_password = var.api_order_database_credentials.password
  database_port     = var.api_order_database_credentials.port
  database_name     = var.api_order_database_credentials.name
}

resource "aws_ssm_parameter" "rds_order_db_url" {
  name  = "/techchallenge/api_order/rds/db_url"
  type  = "String"
  value = module.api_order_rds.rds_endpoint
}

resource "aws_ssm_parameter" "rds_order_db_username" {
  name  = "/techchallenge/api_order/rds/db_username"
  type  = "String"
  value = var.api_order_database_credentials.username
}

resource "aws_ssm_parameter" "rds_order_db_password" {
  name  = "/techchallenge/api_order/rds/db_password"
  type  = "SecureString"
  value = var.api_order_database_credentials.password
}

resource "aws_ssm_parameter" "rds_order_db_port" {
  name  = "/techchallenge/api_order/rds/db_port"
  type  = "String"
  value = var.api_order_database_credentials.port
}

resource "aws_ssm_parameter" "rds_order_db_name" {
  name  = "/techchallenge/api_order/rds/db_name"
  type  = "String"
  value = var.api_order_database_credentials.name
}


module "api_payments_atlas" {
  source            = "./modules/mongo-atlas"
  cluster_name      = var.api_payments_database_credentials.cluster_name
  database_password = var.api_payments_database_credentials.password
  database_username = var.api_payments_database_credentials.username
  org_id            = var.api_payments_database_credentials.org_id
  project_name      = var.api_payments_database_credentials.project_name
  atlas_private_key = var.api_payments_database_credentials.atlas_private_key
  atlas_public_key  = var.api_payments_database_credentials.atlas_public_key
  cidr              = var.api_payments_database_credentials.cidr
  database_name     = var.api_payments_database_credentials.database_name
}

# resource "aws_ssm_parameter" "mongodb_connection_string" {
#   name  = "/techchallenge/api_payments/atlas/mongodb_connection_string"
#   type  = "String"
#   value = module.api_payments_atlas.mongodb_connection_string
# }
#
# resource "aws_ssm_parameter" "mongodb_cluster_host" {
#   name  = "/techchallenge/api_payments/atlas/mongodb_cluster_host"
#   type  = "String"
#   value = module.api_payments_atlas.mongodb_cluster_host
# }
#
#
# resource "aws_ssm_parameter" "atlas_payments_username" {
#   name  = "/techchallenge/api_payments/atlas/db_username"
#   type  = "String"
#   value = var.api_payments_database_credentials.username
# }
#
# resource "aws_ssm_parameter" "atlas_payments_password" {
#   name  = "/techchallenge/api_payments/atlas/db_password"
#   type  = "SecureString"
#   value = var.api_payments_database_credentials.password
# }
#
# resource "aws_ssm_parameter" "atlas_payments_port" {
#   name  = "/techchallenge/api_payments/atlas/db_port"
#   type  = "String"
#   value = var.api_payments_database_credentials.port
# }
#
# resource "aws_ssm_parameter" "atlas_payments_name" {
#   name  = "/techchallenge/api_payments/atlas/db_name"
#   type  = "String"
#   value = var.api_payments_database_credentials.name
# }
