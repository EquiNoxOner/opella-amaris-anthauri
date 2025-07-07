# Define Input Variables
# 1. Azure Location (EastUS)
# 2. Azure Resource Group Name 

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "East US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type = string
  description = "This variable defines the Resource Group"
  default = "dev_rg"
}