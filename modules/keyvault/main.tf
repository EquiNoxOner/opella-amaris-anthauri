resource "azurerm_key_vault" "azkeyvault" {
  name                        = var.key_vault_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku_name                    = "standard"
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
}
