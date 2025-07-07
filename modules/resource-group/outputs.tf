# Create Outputs
# 1. Resource Group Location
# 2. Resource Group Id
# 3. Resource Group Name

# Resource Group Outputs
output "location" {
   description = "Contains a list of the the resource id of the subnets"
   value = azurerm_resource_group.aks_rg.location
}

output "resource_group_id" {
   description = "Contains a list of the the resource id of the subnets"
   value = azurerm_resource_group.aks_rg.id
}

output "resource_group_name" {
   description = "Contains a list of the the resource id of the subnets"
   value = azurerm_resource_group.aks_rg.name
}