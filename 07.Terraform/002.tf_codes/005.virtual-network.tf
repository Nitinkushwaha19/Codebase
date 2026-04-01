resource "azurerm_virtual_network" "VirtualNetwork" {
  count               = var.create_virtual_network ? 1 : 0
  name                = var.resource_group_name
  resource_group_name = azurerm_resource_group.RG[0].name
  location            = azurerm_resource_group.RG[0].location
  address_space       = var.virtual_network_address_space
}
