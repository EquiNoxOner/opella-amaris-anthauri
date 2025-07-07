terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }

  required_version = ">= 0.14.9"
}

resource "azurerm_resource_group" "dev_rg" {
  name = "${var.resource_group_name}-${var.environment}"
  location = var.location
}