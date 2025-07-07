resource "azurerm_resource_group" "rg" {
  name     = "dev-rg"
  location = "East US"
}

module "azure_network" {
  source                       = "../../modules/network/vnet"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  vnet_name                    = "dev-rg-vnet"
  address_space                = ["172.20.176.0/20"]

  subnets = {

    pvt_subnet_priv = {      
      subnet_name           = "dev-vnet-subnet-priv"
      subnet_address_prefix = ["172.20.177.0/24"]
      service_endpoints     = ["Microsoft.Storage.Global"]

      nsg_inbound_rules = [
        # [name, priority, direction, access, protocol, destination_port_range, source_address_prefix, destination_address_prefix]
        # To use defaults, use "" without adding any values.
        ["AllowSolr-AKS-PRIVA-PRIVB", "1000", "Inbound", "Allow", "Tcp", "22", "172.20.177.0/24", "172.20.177.0/24"],
        ["AllowBastionSubnet", "1001", "Inbound", "Allow", "Tcp", "*", "172.20.180.0/24", "172.20.177.0/24"],
        ["Allow_sandm_ne_shared_vnet_suba_subb_dc", "1002", "Inbound", "Allow", "Tcp", "*", "172.20.177.0/24", "172.20.177.0/24"],
        ["AllowSQLNE", "1004", "Inbound", "Allow", "Tcp", "1433", "172.20.177.0/24", "172.20.177.0/24"],
        ["allowloadbalancerservicetag", "4095", "Inbound", "Allow", "Tcp", "8983", "AzureLoadBalancer", "172.20.177.0/24"],
        ["DenyVnetInbound", "4096", "Inbound", "Allow", "*", "*", "VirtualNetwork", "VirtualNetwork"],
        ["", "", "", "", "", "", "", ""],
      ]

      nsg_outbound_rules = [
        # [name, priority, direction, access, protocol, destination_port_range, source_address_prefix, destination_address_prefix]
        # To use defaults, use "" without adding any values.
        ["", "", "", "", "", "", "", ""],
      ]
    }
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "dev-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.azure_network.subnet_ids["dev-vnet-subnet-priv"]
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "dev"
  }
}

module "linux_dummy" {
  source = "../../modules/vm"

  vm_name                      = "dummy-vm-1"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  vm_size                      = "Standard_B2s"
  admin_username               = "adminuser"
  admin_password               = "AOATF@123456789!"
  network_interface_id         = [azurerm_network_interface.nic.id]
  os_disk_caching              = "ReadWrite"
  os_disk_storage_account_type = "Standard_LRS"
  os_disk_size_gb              = "120"
  image_publisher              = "Canonical"
  image_offer                  = "UbuntuServer"
  image_sku                    = "16.04-LTS"
  image_version                = "latest"
}

resource "azurerm_storage_account" "aoa_storage_account" {
  name = "saccaoablob"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "RAGRS"
}

module "azkeyvault" {
  source              = "../../modules/keyvault"
  key_vault_name      = "aoa-kv-dev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tenant_id           = "04f9b505-282f-4d36-a1fd-92f458615a60"
}


module "automation_account" {
  source                  = "../../modules/automation_account"
  automation_account_name = "terraform-automation-account"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = var.location
  tags = {
    environment = "dev"
    project     = "opella"
  }
}
