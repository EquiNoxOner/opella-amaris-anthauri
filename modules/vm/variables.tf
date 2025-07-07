variable "vm_name" {
  description = "The name of the virtual machine"
}

variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure region"
}

variable "vm_size" {
  description = "The size of the virtual machine"
}

variable "admin_username" {
  type        = string
  description = "Username for the VM"
}

variable "admin_password" {
  type        = string
  description = "Password for the VM"
}

variable "network_interface_id" {
  description = "The ID of the network interface"
  type = list(string)
}

variable "os_disk_caching" {
  description = "The caching type for the OS disk"
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
}

variable "image_publisher" {
  description = "The publisher of the VM image"
}

variable "image_offer" {
  description = "The offer of the VM image"
}

variable "image_sku" {
  description = "The SKU of the VM image"
}

variable "image_version" {
  description = "The version of the VM image"
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in gigabytes"
  type        = number
  default     = 30  # Set the desired default size here
}
