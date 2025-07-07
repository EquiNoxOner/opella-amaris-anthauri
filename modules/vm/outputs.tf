output "vm_id" {
  value = azurerm_linux_virtual_machine.dummy.id
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.dummy.network_interface_ids[0]
}
