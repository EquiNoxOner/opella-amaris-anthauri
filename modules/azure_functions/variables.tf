variable "function_app_name" {
  description = "Name of the Azure Function App"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "app_service_plan_id" {
  description = "ID of the Azure App Service Plan"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account for the Function App"
}

variable "storage_account_access_key" {
  description = "Access key for the Azure Storage Account"
}

variable "tags" {
  description = "Tags to apply to the Azure Function App"
  type        = map(string)
}
