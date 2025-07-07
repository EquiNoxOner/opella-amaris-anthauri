terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfaoastate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  subscription_id   = "d2a9239a-eba0-4e73-9ed3-133d505f468c"
  tenant_id         = "04f9b505-282f-4d36-a1fd-92f458615a60"
  client_id         = "cff1cd3e-0709-4a6e-a665-e0c2e5757ce2"
  client_secret     = "rxZ8Q~gGqDWjwe5Ne-UEh7ipJgpIWPkqla0Ilbig"
  features {}
}
