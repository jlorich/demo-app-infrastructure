locals {
  plan_name                   = "${lower(var.name)}-${lower(var.type)}-plan"
  default_resource_group_name = "${var.name}-app-service-plan-${var.environment}-rg"
  resource_group_name         = "${var.resource_group_name == "" ? local.default_resource_group_name : var.resource_group_name}"
}

resource "azurerm_resource_group" "default" {
  name     = "${local.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "default" {
  name                = "${local.plan_name}"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  kind                = "${var.type}"

  sku {
    tier = "${var.tier}"
    size = "${var.sku_size}"
  }

  properties {
    reserved = true
  }
}

output "id" {
  value = "${azurerm_app_service_plan.default.id}"
}

output "location" {
  value = "${azurerm_resource_group.default.location}"
}
