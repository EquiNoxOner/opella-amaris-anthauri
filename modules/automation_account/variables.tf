variable "automation_account_name" {
  description = "Name of the Azure Automation Account"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "tags" {
  description = "Tags to apply to the Azure Automation Account"
  type        = map(string)
}
