terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
}

module "vpc" {
  source               = "./modules/vpc"
  name_prefix          = var.name_prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "lambda" {
  source             = "./modules/lambda"
  name_prefix        = var.name_prefix
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  lambda_memory_mb   = var.lambda_memory_mb
  lambda_timeout_sec = var.lambda_timeout_sec
  environment_vars   = var.lambda_environment
}

module "apigw" {
  source             = "./modules/apigw"
  name_prefix        = var.name_prefix
  region             = var.region
  lambda_arn         = module.lambda.lambda_arn
  log_retention      = var.api_log_retention_days
}

# Remove or comment out this block if using HTTP API
# module "waf" {
#   source       = "./modules/waf"
#   name_prefix  = var.name_prefix
#   scope        = "REGIONAL"
#   resource_arn = module.apigw.stage_arn
#   rate_limit   = var.waf_rate_limit
# }
