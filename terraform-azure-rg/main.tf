terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"
}

module "virtual_network" {
    source = "./modules/virtual_network"
    depends_on = [module.resource_group]
}

module "public_ip" {
  source = "./modules/public_ip"
  depends_on = [module.resource_group]
}

module "subnet" {
  source = "./modules/subnet"
  depends_on = [module.virtual_network]
}

module "nic" {
  source = "./modules/nic"
  depends_on = [module.subnet , module.public_ip]
}

module "virtual_machine" {
  source = "./modules/virtual_machine"
  depends_on = [module.nic]
}