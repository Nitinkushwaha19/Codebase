resource "azurerm_public_ip" "example_basic" {
  name                = var.resource_public_ip_name
  resource_group_name = azurerm_resource_group.RG[0].name
  location            = azurerm_resource_group.RG[0].location
  sku                 = "Basic"
  allocation_method   = "Static"

  tags = {
    Environment = "Development"
    Purpose     = "Testing"
  }

}
