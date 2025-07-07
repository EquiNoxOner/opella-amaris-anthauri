resource "azurerm_storage_account" "aoa_storage_account" {
  name                            = lower("int${var.environment}${var.prefix}sa") #"${var.environment}dtcsa"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = true

  tags = var.tags
}

resource "azurerm_storage_container" "aoa_storage_containers" {
  count                 = length(var.containers)
  name                  = "${var.environment}-${var.prefix}-${var.containers[count.index]}"
  storage_account_name  = azurerm_storage_account.dtc_storage_account.name
  container_access_type = "blob"
}