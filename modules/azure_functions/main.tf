resource "azurerm_function_app" "tffunctapp" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = var.app_service_plan_id

  storage_account_name   = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
    "WEBSITE_NODE_DEFAULT_VERSION" = "14.x"
    # Add other app settings as needed...
  }

  site_config {
    always_on = true
  }

  tags = var.tags
}
