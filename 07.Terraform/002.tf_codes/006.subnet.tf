resource "azurerm_subnet" "vsubnet" {
  count                = var.create_virtual_network ? 1 : 0
  name                 = var.create_subnet_name
  resource_group_name  = azurerm_resource_group.RG[0].name
  virtual_network_name = azurerm_virtual_network.VirtualNetwork[0].name
  address_prefixes     = var.virtual_subnet_address_space
}
