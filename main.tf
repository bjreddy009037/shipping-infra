module "vpc" {
  source = "github.com/bjreddy009037/tf-module-vpc"
  VPC_CIDR_BLOCK = var.VPC_CIDR_BLOCK
  COMPONENT = var.COMPONENT
  ENV = var.ENV
  AZ = var.AZ
  SUBNET_CIDR = var.SUBNET_CIDR
}


module "mysql" {
  depends_on = [module.vpc]
  source = "github.com/bjreddy009037/tf-module-rds-mysql"
  DB_NAME = var.DB_NAME
  ENGINE = var.ENGINE
  ENGINE_VERSION = var.ENGINE_VERSION
  SKIP_FINAL_SNAPSHOT = var.SKIP_FINAL_SNAPSHOT
  INSTANCE_CLASS = var.INSTANCE_CLASS
  ENV = var.ENV
  COMPONENT = var.COMPONENT
}