output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.nsg.id
}

output "nsg_name" {
  description = "The name of the Network Security Group"
  value       = azurerm_network_security_group.nsg.name
}

output "nsg_resource_group" {
  description = "The resource group in which the NSG is created"
  value       = azurerm_network_security_group.nsg.resource_group_name
}

output "nsg_location" {
  description = "The Azure region where the NSG is deployed"
  value       = azurerm_network_security_group.nsg.location
}
