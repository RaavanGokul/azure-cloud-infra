provider "azurerm" {
  features {}
}

module "network" {
  source = "../../modules/network"

  resource_group_name = "rg-uat-demo"
  location            = "East US"
  vnet_name           = "vnet-uat-demo"
  subnet_name         = "subnet-uat-demo"
}

module "vm" {
  source = "../../modules/vm"

  vm_name             = "vm-uat-demo"
  location            = "East US"
  resource_group_name = module.network.resource_group_name
  subnet_id           = module.network.subnet_id

  admin_username = "azureuser"
  vm_size        = "Standard_B2s"

  ssh_public_key = "~/.ssh/id_rsa.pub"
}