data "aws_ssm_parameter" "vpc_id" {
  name = "/techchallenge/eks/vpc_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/techchallenge/eks/public_subnet_ids"
}

# RDS API-FOOD
module "api_food_rds" {
  source             = "./modules/rds"
  region             = var.region
  availability_zone  = var.availability_zones[0]
  vpc_id             = data.aws_ssm_parameter.vpc_id.value
  database_subnetids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  database_username  = var.api_food_database_credentials.username
  database_password  = var.api_food_database_credentials.password
  database_port      = var.api_food_database_credentials.port
  database_name      = var.api_food_database_credentials.name
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
  source             = "./modules/rds"
  region             = var.region
  availability_zone  = var.availability_zones[0]
  vpc_id             = data.aws_ssm_parameter.vpc_id.value
  database_subnetids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  database_username  = var.api_order_database_credentials.username
  database_password  = var.api_order_database_credentials.password
  database_port      = var.api_order_database_credentials.port
  database_name      = var.api_order_database_credentials.name
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


# RDS API-PAYMENTS
module "api_payments_rds" {
  source             = "./modules/rds"
  region             = var.region
  availability_zone  = var.availability_zones[0]
  vpc_id             = data.aws_ssm_parameter.vpc_id.value
  database_subnetids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  database_username  = var.api_payments_database_credentials.username
  database_password  = var.api_payments_database_credentials.password
  database_port      = var.api_payments_database_credentials.port
  database_name      = var.api_payments_database_credentials.name
}

resource "aws_ssm_parameter" "rds_payments_db_url" {
  name  = "/techchallenge/api_payments/rds/db_url"
  type  = "String"
  value = module.api_payments_rds.rds_endpoint
}

resource "aws_ssm_parameter" "rds_payments_db_username" {
  name  = "/techchallenge/api_payments/rds/db_username"
  type  = "String"
  value = var.api_payments_database_credentials.username
}

resource "aws_ssm_parameter" "rds_payments_db_password" {
  name  = "/techchallenge/api_payments/rds/db_password"
  type  = "SecureString"
  value = var.api_payments_database_credentials.password
}

resource "aws_ssm_parameter" "rds_payments_db_port" {
  name  = "/techchallenge/api_payments/rds/db_port"
  type  = "String"
  value = var.api_payments_database_credentials.port
}

resource "aws_ssm_parameter" "rds_payments_db_name" {
  name  = "/techchallenge/api_payments/rds/db_name"
  type  = "String"
  value = var.api_payments_database_credentials.name
}