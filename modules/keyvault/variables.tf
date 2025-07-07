variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}