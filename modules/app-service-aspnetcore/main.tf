locals {
  default_resource_group_name = "${var.name}-${var.environment}-rg"
  resource_group_name         = "${var.resource_group_name == "" ? local.default_resource_group_name : var.resource_group_name}"

  name_components = ["${var.app_service_name_prefix}", "${var.name}", "${var.environment}", "app"]
}

resource "azurerm_resource_group" "default" {
  name     = "${local.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_app_service" "default" {
  name                = "${join("-", compact(local.name_components))}"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  app_service_plan_id = "${var.app_service_plan_id}"

  site_config = {
    always_on = true
  }
}

output "id" {
  value = "${azurerm_app_service.default.id}"
}

output "hostname" {
  value = "https://${azurerm_app_service.default.default_site_hostname}"
}
