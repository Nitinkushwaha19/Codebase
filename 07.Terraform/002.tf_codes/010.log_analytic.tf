resource "azurerm_log_analytics_workspace" "law" {
  name                = var.resource_log_analytics_workspace_name
  resource_group_name = azurerm_resource_group.RG[0].name
  location            = azurerm_resource_group.RG[0].location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    environment = var.environment
    project     = var.project
  }
}

