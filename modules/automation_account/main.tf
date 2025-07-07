resource "azurerm_automation_account" "azautacc" {
  name                = var.automation_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "Basic"

  tags = var.tags
}
