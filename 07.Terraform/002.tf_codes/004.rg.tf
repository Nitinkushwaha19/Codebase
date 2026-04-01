resource "azurerm_resource_group" "RG" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.resouce_group_location
}
