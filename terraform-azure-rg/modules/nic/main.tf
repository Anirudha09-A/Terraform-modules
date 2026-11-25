data "azurerm_subnet" "subnet" {
  name                 = "my-subnet"
  virtual_network_name = "my-vnet"
  resource_group_name  = "my-resource-group"
}

data "azurerm_public_ip" "pip" {
  name                = "my-public-ip"
  resource_group_name = "my-resource-group"
}

resource "azurerm_network_interface" "nic" {
  name                = "my-nic"
  location            = "Central India"
  resource_group_name = "my-resource-group"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip.id
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}