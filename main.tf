provider "azurerm" {
  version = "=1.20.0"
}

locals {
  default_resource_group_name = "${var.name}-${var.environment}-rg"
  resource_group_name         = "${var.resource_group_name == "" ? local.default_resource_group_name : var.resource_group_name}"
}

module "app_service_plan" {
  source      = "./modules/app-service-plan"
  name        = "demo"
  environment = "${var.environment}"
}

module "java_app_service" {
  source                  = "./modules/app-service-java"
  app_service_plan_id     = "${module.app_service_plan.id}"
  name                    = "demo-java-app-service"
  environment             = "${var.environment}"
  app_service_name_prefix = "${var.prefix}"
}

module "aspnetcore_app_service" {
  source                  = "./modules/app-service-aspnetcore"
  app_service_plan_id     = "${module.app_service_plan.id}"
  name                    = "demo-aspnetcore-app-service"
  environment             = "${var.environment}"
  app_service_name_prefix = "${var.prefix}"
}
