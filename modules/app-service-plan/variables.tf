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

variable "type" {
  type        = "string"
  description = "Type of App Service Plan"
  default     = "Linux"
}

variable "name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = "demo"
}

variable "tier" {
  type        = "string"
  description = "SKU tier of the App Service Plan"
  default     = "Basic"
}

variable "sku_size" {
  type        = "string"
  description = "SKU size of the App Service Plan"
  default     = "B1"
}
