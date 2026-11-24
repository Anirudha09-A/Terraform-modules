resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = "Central India"

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}