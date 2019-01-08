variable "location" {
  type        = "string"
  description = "Location of the azure resource group."
  default     = "WestUS2"
}

variable "environment" {
  type        = "string"
  description = "Name of the deployment environment"
  default     = "sandbox"
}

variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = ""
}

variable "app_service_plan_id" {
  type        = "string"
  description = "Id of the App Service Plan"
}

variable "name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = "demo-app-service"
}

variable "app_service_name_prefix" {
  type        = "string"
  description = "A prefix for the hostname on the app service (does not apply to RG)"
  default     = ""
}
