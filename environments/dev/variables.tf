variable "resource_group_name" {
  description = "Name of the Azure resource group to create"
  default     = "dev-rg"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "vnet_name" {
  type = string
  description = "Vnet name"
  default = "aoa-vnet-dev"
}

variable "storage_account_name" {
  type = string
  description = "storage_account name"
  default = "aoa-sa-dev"
}

variable "vm_name" {
  type = string
  description = "vm name"
  default = "aoa-vm-dev"
}

variable "functionapp_name" {
  type = string
  description = "functionapp name"
  default = "aoa-fapp-dev"
}

variable "kv_name" {
  type = string
  description = "key vault name"
  default = "aoa-kv-dev"
}