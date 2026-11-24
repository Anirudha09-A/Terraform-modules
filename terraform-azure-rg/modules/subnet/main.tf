resource "azurerm_subnet" "subnet" {
  name                 = "my-subnet"
  resource_group_name  = "my-resource-group"
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}