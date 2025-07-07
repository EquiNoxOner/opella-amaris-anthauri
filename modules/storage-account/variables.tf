variable "resource_group_name" {
  description = "The name of resource group to place all our resources"
}

variable "environment" {
  description = "(Required) The environment prefix used in names"
  type        = string
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default     = "North Europe"
}

variable "prefix" {
  description = "(Required) Prefix used to create resource names"
  type        = string
  validation {
    condition     = length(var.prefix) > 2 && length(var.prefix) < 11
    error_message = "Prefix must be between 3 and 10 char long."
  }
}

variable "containers" {
  description = ""
  type        = list(any)
}

variable "tags" {
  description = "(Required) Tags of the ASP to be created"
}
