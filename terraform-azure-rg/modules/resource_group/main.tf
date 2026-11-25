resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = "Central India"

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}