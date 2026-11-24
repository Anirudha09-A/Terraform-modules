resource "azurerm_public_ip" "pip" {
  name                = "my-public-ip"
  location            = "Central India"
  resource_group_name = "my-resource-group"
  allocation_method   = "Static"
  sku                 = "Standard"
}