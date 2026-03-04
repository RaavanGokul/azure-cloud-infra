provider "azurerm" {
  features {}
}

module "network" {
  source = "../../modules/network"

  resource_group_name = "rg-prod-demo"
  location            = "East US"
  vnet_name           = "vnet-prod-demo"
  subnet_name         = "subnet-prod-demo"
}

module "vm" {
  source = "../../modules/vm"

  vm_name             = "vm-prod-demo"
  location            = "East US"
  resource_group_name = module.network.resource_group_name
  subnet_id           = module.network.subnet_id

  admin_username = "azureuser"
  vm_size        = "Standard_D2s_v3"

  ssh_public_key = "~/.ssh/id_rsa.pub"
}