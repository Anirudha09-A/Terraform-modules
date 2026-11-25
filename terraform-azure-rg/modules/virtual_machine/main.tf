data "azurerm_network_interface" "nic" {
  name                = "my-nic"
  resource_group_name = "my-resource-group"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "my-vm"
  location            = "Central India"
  resource_group_name = "my-resource-group"
  size                = "Standard_B2ts_v2"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd12345!"

  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}