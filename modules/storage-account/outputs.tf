output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.aoa_storage_account.name
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.aoa_storage_account.id
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account"
  value       = azurerm_storage_account.aoa_storage_account.primary_blob_endpoint
}

output "container_names" {
  description = "Names of the created storage containers"
  value       = [for c in azurerm_storage_container.aoa_storage_containers : c.name]
}

output "container_ids" {
  description = "IDs of the created storage containers"
  value       = [for c in azurerm_storage_container.aoa_storage_containers : c.id]
}
