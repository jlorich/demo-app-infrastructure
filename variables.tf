variable "location" {
  type        = "string"
  description = "Location of the azure resource group."
  default     = "WestUS2"
}

variable "environment" {
  type        = "string"
  description = "Name of the deployment environment"
}

variable "name" {
  type        = "string"
  description = "Name of the deployment."
  default     = "demo-java-app-service"
}

variable "prefix" {
  type        = "string"
  description = "A prefix for globally unique resources (app service hostname)"
  default     = "mtcden"
}

variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = ""
}
