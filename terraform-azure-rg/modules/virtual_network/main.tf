resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet"
  location            = "Central India"
  resource_group_name = "my-resource-group"
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}